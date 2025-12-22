<script lang="ts">
	import "./layout.css";
	import { base } from "$app/paths";
	import { page } from "$app/state";

	import InteractiveBackground from "$lib/components/InteractiveBackground.svelte";
	import { onMount } from "svelte";

	let { children } = $props();

	let cursorRing: HTMLDivElement;
	let scrolled = $state(false);

	const navItems = [
		{ name: "Home", path: `${base}/` },
		{ name: "Projects", path: `${base}/#projects` },
		{ name: "Writeups", path: `${base}/writeups` },
	];

	onMount(() => {
		const moveCursor = (e: MouseEvent) => {
			if (!cursorRing) return;
			cursorRing.style.transform = `translate3d(${e.clientX - 12}px, ${e.clientY - 12}px, 0)`;
		};

		const handleScroll = () => {
			scrolled = window.scrollY > 50;
		};

		window.addEventListener("mousemove", moveCursor);
		window.addEventListener("scroll", handleScroll);
		return () => {
			window.removeEventListener("mousemove", moveCursor);
			window.removeEventListener("scroll", handleScroll);
		};
	});
</script>

<div class="cursor-ring hidden md:block" bind:this={cursorRing}></div>

<InteractiveBackground />

<div class="min-h-screen relative overflow-hidden flex flex-col">
	<!-- Navigation -->
	<nav
		class="fixed top-0 left-0 right-0 z-50 flex justify-between items-center p-8 px-12 transition-all duration-300 {scrolled
			? 'nav-scrolled'
			: ''}"
	>
		<a
			href="{base}/"
			class="text-2xl font-black tracking-tighter hover:text-brand-primary transition-colors"
		>
			ZAIN.
		</a>

		<div class="flex gap-10 items-center">
			{#each navItems as item}
				<a
					href={item.path}
					class="text-xs font-bold uppercase tracking-[0.2em] hover:text-brand-primary transition-colors {page
						.url.pathname === item.path
						? 'text-brand-primary'
						: 'text-brand-muted'}"
				>
					{item.name}
				</a>
			{/each}
			<a
				href="mailto:contact@zain.dev"
				class="px-6 py-2 bg-brand-primary text-brand-bg text-[10px] font-bold uppercase tracking-widest rounded-full hover:scale-105 transition-transform"
			>
				Let's Talk
			</a>
		</div>
	</nav>

	<!-- Main Content -->
	<main class="relative z-10 flex-1 flex flex-col">
		{@render children()}
	</main>
</div>

<style>
	:global(html) {
		scroll-behavior: smooth;
	}
</style>
