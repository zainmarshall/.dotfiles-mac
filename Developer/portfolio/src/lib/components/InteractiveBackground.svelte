<script lang="ts">
    import { onMount } from "svelte";

    let canvas: HTMLCanvasElement;
    let ctx: CanvasRenderingContext2D;
    let particles: Particle[] = [];
    let mouse = { x: 0, y: 0 };

    class Particle {
        x: number;
        y: number;
        size: number;
        speedX: number;
        speedY: number;
        color: string;

        constructor(width: number, height: number) {
            this.x = Math.random() * width;
            this.y = Math.random() * height;
            this.size = Math.random() * 2 + 1;
            this.speedX = Math.random() * 0.8 - 0.4;
            this.speedY = Math.random() * 0.8 - 0.4;
            this.color = Math.random() > 0.5 ? "#00ffcc" : "#ff0077";
        }

        update(width: number, height: number, mouseX: number, mouseY: number) {
            this.x += this.speedX;
            this.y += this.speedY;

            if (this.x > width) this.x = 0;
            if (this.x < 0) this.x = width;
            if (this.y > height) this.y = 0;
            if (this.y < 0) this.y = height;

            // Mouse interaction using distance squared (avoids Math.sqrt)
            let dx = mouseX - this.x;
            let dy = mouseY - this.y;
            let distanceSq = dx * dx + dy * dy;
            if (distanceSq < 10000) {
                // 100 * 100
                this.x -= dx / 50;
                this.y -= dy / 50;
            }
        }

        draw() {
            ctx.fillStyle = this.color;
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
            ctx.fill();
        }
    }

    function handleResize() {
        if (!canvas) return;
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
    }

    function animate() {
        if (!ctx || !canvas) return;
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        // Draw particles
        for (let i = 0; i < particles.length; i++) {
            particles[i].update(canvas.width, canvas.height, mouse.x, mouse.y);
            particles[i].draw();
        }

        requestAnimationFrame(animate);
    }

    onMount(() => {
        ctx = canvas.getContext("2d", { alpha: true })!;
        handleResize();
        window.addEventListener("resize", handleResize);

        // Increased particle count for richer background
        for (let i = 0; i < 100; i++) {
            particles.push(new Particle(canvas.width, canvas.height));
        }

        animate();

        const handleMouseMove = (e: MouseEvent) => {
            mouse.x = e.clientX;
            mouse.y = e.clientY;
        };

        window.addEventListener("mousemove", handleMouseMove);

        return () => {
            window.removeEventListener("resize", handleResize);
            window.removeEventListener("mousemove", handleMouseMove);
        };
    });
</script>

<canvas
    bind:this={canvas}
    class="fixed inset-0 pointer-events-none z-0 opacity-40"
></canvas>
