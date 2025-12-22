<script lang="ts">
    import { fly, fade } from "svelte/transition";
    let { data } = $props();

    const Content = $derived(data.content);
</script>

<article class="max-w-3xl mx-auto px-12 pt-32 pb-24">
    <!-- Header -->
    <header class="mb-12">
        <a
            href="/writeups"
            class="text-xs font-mono text-brand-muted hover:text-brand-primary transition-colors flex items-center gap-2 mb-8 group"
        >
            <span class="group-hover:-translate-x-1 transition-transform"
                >←</span
            > Back to writeups
        </a>

        <div class="flex flex-wrap gap-2 mb-6">
            {#each data.meta.categories as category}
                <span
                    class="px-2 py-0.5 rounded text-[10px] font-mono bg-brand-primary/10 text-brand-primary uppercase tracking-wider"
                >
                    {category}
                </span>
            {/each}
        </div>

        <h1 class="text-4xl md:text-5xl font-black tracking-tight mb-4">
            {data.meta.title}
        </h1>

        <div class="flex items-center gap-4 text-sm text-brand-muted font-mono">
            <span>{data.meta.date}</span>
            <span class="w-1 h-1 rounded-full bg-brand-muted/30"></span>
            <span>{data.meta.description}</span>
        </div>
    </header>

    <!-- Content -->
    <div class="prose-custom" in:fade={{ duration: 600, delay: 200 }}>
        <Content />
    </div>

    <!-- Footer -->
    <footer class="mt-24 pt-12 border-t border-white/5">
        <div class="glass p-8 rounded-3xl text-center">
            <h3 class="text-xl font-bold mb-2">Enjoyed this writeup?</h3>
            <p class="text-brand-muted mb-6">
                Check out my other projects or get in touch.
            </p>
            <div class="flex justify-center gap-4">
                <a
                    href="/"
                    class="text-brand-primary font-bold hover:text-glow transition-all"
                    >Projects</a
                >
                <span class="text-white/10">|</span>
                <a
                    href="mailto:contact@zain.dev"
                    class="text-brand-primary font-bold hover:text-glow transition-all"
                    >Email</a
                >
            </div>
        </div>
    </footer>
</article>

<style>
    /* Custom Markdown Styling */
    :global(.prose-custom) {
        color: var(--color-brand-text);
        line-height: 1.8;
        font-size: 1.1rem;
    }

    :global(.prose-custom h1, .prose-custom h2, .prose-custom h3) {
        color: white;
        font-weight: 800;
        margin-top: 2.5rem;
        margin-bottom: 1.25rem;
        letter-spacing: -0.02em;
    }

    :global(.prose-custom h2) {
        font-size: 1.8rem;
    }
    :global(.prose-custom h3) {
        font-size: 1.4rem;
    }

    :global(.prose-custom p) {
        margin-bottom: 1.5rem;
        color: var(--color-brand-muted);
    }

    :global(.prose-custom code) {
        background: rgba(255, 255, 255, 0.05);
        padding: 0.2rem 0.4rem;
        border-radius: 0.4rem;
        font-family: var(--font-mono);
        font-size: 0.9em;
        color: var(--color-brand-primary);
    }

    :global(.prose-custom pre) {
        background: #0d0d0f;
        padding: 1.5rem;
        border-radius: 1rem;
        overflow-x: auto;
        border: 1px solid rgba(255, 255, 255, 0.05);
        margin: 2rem 0;
    }

    :global(.prose-custom pre code) {
        background: transparent;
        padding: 0;
        color: #e0e0e0;
    }

    :global(.prose-custom ul) {
        list-style: none;
        padding-left: 1.5rem;
        margin-bottom: 1.5rem;
    }

    :global(.prose-custom ul li) {
        position: relative;
        margin-bottom: 0.5rem;
        color: var(--color-brand-muted);
    }

    :global(.prose-custom ul li::before) {
        content: "→";
        position: absolute;
        left: -1.5rem;
        color: var(--color-brand-primary);
        font-weight: bold;
    }
</style>
