<script lang="ts">
    import { fly, fade } from "svelte/transition";
    import ProjectCard from "$lib/components/ProjectCard.svelte";
    import { projects } from "$lib/projects";

    let visible = $state(false);
    $effect(() => {
        visible = true;
    });

    const techItems = [
        { name: "C++", color: "#00599c" },
        { name: "Python", color: "#3776ab" },
        { name: "Java", color: "#007396" },
        { name: "Svelte", color: "#ff3e00" },
        { name: "Tailwind", color: "#38bdf8" },
        { name: "Docker", color: "#2496ed" },
        { name: "Linux", color: "#fcc624" },
        { name: "Raspberry Pi", color: "#c51a4a" },
        { name: "CyberSecurity", color: "#bcff00" },
    ];

    const education = [
        {
            title: "Thomas Jefferson High School for Science and Technology",
            period: "2023 - Present",
            description:
                "Intended Lab: Computer Systems. Focusing on systems architecture, performance optimization, and advanced computer science.",
            location: "Alexandria, VA",
        },
    ];
</script>

<div class="max-w-6xl mx-auto px-12 flex flex-col gap-40 pb-40 pt-48 shrink-0">
    <!-- Restructured Hero Section -->
    <section
        class="grid grid-cols-1 md:grid-cols-5 gap-16 items-center relative"
    >
        {#if visible}
            <!-- Text Content (Hero Overwrite) -->
            <div class="md:col-span-3 space-y-10">
                <div class="space-y-6">
                    <h2
                        in:fly={{ y: 30, duration: 800, delay: 200 }}
                        class="text-xs font-black uppercase tracking-[0.5em] text-brand-primary"
                    >
                        Developer • Security Researcher • Student
                    </h2>
                    <h1
                        in:fly={{ y: 50, duration: 800, delay: 400 }}
                        class="text-[clamp(3.5rem,8vw,6rem)] font-black leading-[0.9] tracking-tighter"
                    >
                        HI, I'M <span
                            class="text-transparent bg-clip-text bg-gradient-to-r from-brand-primary to-brand-secondary"
                            >ZAIN.</span
                        >
                    </h1>
                    <p
                        in:fade={{ duration: 1000, delay: 800 }}
                        class="text-xl md:text-2xl text-brand-muted max-w-xl font-medium leading-relaxed"
                    >
                        A 15-year-old developer at TJHSST building
                        high-performance systems and exploring the world of
                        offensive security.
                    </p>
                </div>

                <!-- Social Icons & Stats -->
                <div
                    in:fade={{ duration: 1000, delay: 1000 }}
                    class="flex flex-wrap items-center gap-10"
                >
                    <div class="flex items-center gap-4">
                        <a
                            href="https://github.com/zainmarshall"
                            target="_blank"
                            aria-label="GitHub"
                            class="p-4 bg-white/5 rounded-2xl hover:bg-brand-primary/20 hover:text-brand-primary transition-all group"
                        >
                            <svg
                                class="w-6 h-6 fill-current"
                                viewBox="0 0 24 24"
                                ><path
                                    d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.041-1.416-4.041-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"
                                /></svg
                            >
                        </a>
                        <a
                            href="https://www.linkedin.com/in/zain-marshall-4132b1338"
                            target="_blank"
                            aria-label="LinkedIn"
                            class="p-4 bg-white/5 rounded-2xl hover:bg-brand-primary/20 hover:text-brand-primary transition-all group"
                        >
                            <svg
                                class="w-6 h-6 fill-current"
                                viewBox="0 0 24 24"
                                ><path
                                    d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"
                                /></svg
                            >
                        </a>
                    </div>

                    <!-- Detailed Stats Overlay -->
                    <div class="flex gap-10 border-l border-white/10 pl-10">
                        <div>
                            <div class="text-3xl font-black text-brand-primary">
                                C++
                            </div>
                            <div
                                class="text-[10px] font-bold uppercase tracking-widest text-brand-muted"
                            >
                                Competitive
                            </div>
                        </div>
                        <div>
                            <div
                                class="text-3xl font-black text-brand-secondary"
                            >
                                LINUX
                            </div>
                            <div
                                class="text-[10px] font-bold uppercase tracking-widest text-brand-muted"
                            >
                                Rooted
                            </div>
                        </div>
                    </div>
                </div>

                <div
                    in:fade={{ duration: 1000, delay: 1200 }}
                    class="flex gap-4"
                >
                    <a
                        href="#projects"
                        class="px-8 py-4 bg-white text-black font-black text-sm uppercase tracking-widest rounded-full hover:scale-105 transition-transform"
                    >
                        View My Work
                    </a>
                    <a
                        href="mailto:zainmarshall1000@gmail.com"
                        class="px-8 py-4 border border-white/10 text-white font-black text-sm uppercase tracking-widest rounded-full hover:bg-white/5 transition-all"
                    >
                        Get In Touch
                    </a>
                </div>
            </div>

            <!-- Visual Element / Photo Placeholder -->
            <div
                in:fly={{ x: 30, duration: 1000, delay: 600 }}
                class="md:col-span-2 relative hidden md:block"
            >
                <div class="relative aspect-[4/5] group">
                    <div
                        class="absolute inset-0 bg-brand-primary rounded-[3rem] rotate-3 group-hover:rotate-0 transition-transform duration-500"
                    ></div>
                    <div
                        class="absolute inset-0 bg-brand-surface rounded-[3rem] overflow-hidden border border-white/10 group-hover:-translate-x-4 group-hover:-translate-y-4 transition-transform duration-500"
                    >
                        <div
                            class="w-full h-full bg-gradient-to-br from-brand-surface to-[#1a1a1f] flex flex-col items-center justify-center p-8 gap-4"
                        >
                            <span
                                class="text-brand-muted font-black text-2xl opacity-20 text-center uppercase tracking-widest"
                                >ZAIN MARSHALL</span
                            >
                            <div
                                class="w-20 h-1 bg-brand-primary/20 rounded-full"
                            ></div>
                            <p
                                class="text-[10px] text-brand-muted/40 font-mono text-center px-4 uppercase tracking-[0.2em]"
                            >
                                DISTRICT OF COLUMBIA<br />
                                EST. 2009
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        {/if}
    </section>

    <!-- Education Section -->
    <section class="space-y-16">
        <div class="flex flex-col gap-4">
            <span
                class="text-[10px] font-black uppercase tracking-[0.4em] text-brand-accent"
                >Journey</span
            >
            <h2 class="text-6xl font-black tracking-tighter">Education.</h2>
        </div>

        <div class="relative border-l-2 border-white/5 pl-12 space-y-20">
            {#each education as item}
                <div class="relative">
                    <div
                        class="absolute -left-[53px] top-0 w-4 h-4 rounded-full bg-brand-accent shadow-[0_0_20px_rgba(188,255,0,0.5)]"
                    ></div>
                    <div class="space-y-2">
                        <span
                            class="text-brand-accent font-mono text-sm uppercase tracking-widest"
                            >{item.period}</span
                        >
                        <h3 class="text-3xl font-black">{item.title}</h3>
                        <p class="text-brand-muted max-w-2xl leading-relaxed">
                            {item.description}
                        </p>
                        <span
                            class="text-xs font-bold text-white/30 uppercase tracking-widest"
                            >{item.location}</span
                        >
                    </div>
                </div>
            {/each}
        </div>
    </section>

    <!-- Projects Section -->
    <section id="projects" class="scroll-mt-32 space-y-20">
        <div
            class="flex flex-col md:flex-row md:items-end justify-between gap-10"
        >
            <div class="space-y-4">
                <span
                    class="text-[10px] font-black uppercase tracking-[0.4em] text-brand-secondary"
                    >Portfolio</span
                >
                <h2 class="text-6xl md:text-8xl font-black tracking-tighter">
                    Production Grade.
                </h2>
            </div>
            <p
                class="text-brand-muted max-w-sm text-lg font-medium leading-relaxed"
            >
                A collection of my recent captures, technical deep dives, and
                security research.
            </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-12 gap-y-24">
            {#each projects as project, i}
                <div class={i % 2 === 1 ? "md:mt-24" : ""}>
                    <ProjectCard {project} />
                </div>
            {/each}
        </div>
    </section>

    <!-- CTA -->
    <section>
        <div
            class="bg-brand-primary p-20 rounded-[4rem] text-center space-y-8 shadow-[0_0_50px_rgba(0,255,204,0.3)]"
        >
            <h2
                class="text-6xl md:text-8xl font-black text-brand-bg tracking-tighter shrink-0 leading-tight"
            >
                LET'S SYNC<br />SYSTEMS.
            </h2>
            <a
                href="mailto:zainmarshall1000@gmail.com"
                class="inline-block px-12 py-6 bg-brand-bg text-brand-primary text-xl font-black uppercase tracking-[0.2em] rounded-full hover:scale-110 transition-transform shadow-2xl"
            >
                zainmarshall1000@gmail.com
            </a>
        </div>
    </section>
</div>

<style>
    @keyframes marquee {
        0% {
            transform: translateX(0);
        }
        100% {
            transform: translateX(-50%);
        }
    }

    .animate-marquee {
        display: flex;
        width: max-content;
        animation: marquee 30s linear infinite;
    }

    .animate-marquee:hover {
        animation-play-state: paused;
    }
</style>
