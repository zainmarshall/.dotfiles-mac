<script lang="ts">
    import { base } from "$app/paths";
    import { fly } from "svelte/transition";
    let { data } = $props();
</script>

<div class="max-w-6xl mx-auto px-12 pt-32 pb-24">
    <div class="flex flex-col gap-4 mb-16">
        <div class="flex items-center gap-4">
            <div class="h-[1px] w-12 bg-brand-primary"></div>
            <span
                class="text-xs font-mono uppercase tracking-[0.3em] text-brand-primary"
                >Knowledge Base</span
            >
        </div>
        <h1 class="text-5xl font-black tracking-tighter">CTF Writeups</h1>
        <p class="text-brand-muted max-w-xl text-lg">
            A collection of my recent captures, technical deep dives, and
            security research.
        </p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
        {#each data.posts as post, i}
            <a
                href="{base}/writeups/{post.slug}"
                in:fly={{ y: 20, duration: 800, delay: i * 100 }}
                class="group glass p-8 rounded-3xl border border-white/5 hover:border-brand-primary/30 transition-all flex flex-col gap-6"
            >
                <div class="flex flex-wrap gap-2">
                    {#each post.categories as category}
                        <span
                            class="px-2 py-0.5 rounded text-[10px] font-mono bg-white/5 text-brand-muted uppercase tracking-wider group-hover:bg-brand-primary/10 group-hover:text-brand-primary transition-colors"
                        >
                            {category}
                        </span>
                    {/each}
                </div>

                <div>
                    <h2
                        class="text-2xl font-bold mb-2 group-hover:text-brand-primary transition-colors"
                    >
                        {post.title}
                    </h2>
                    <p class="text-brand-muted line-clamp-2 leading-relaxed">
                        {post.description}
                    </p>
                </div>

                <div class="mt-auto flex items-center justify-between">
                    <span class="text-xs font-mono text-brand-muted/50"
                        >{post.date}</span
                    >
                    <span
                        class="text-brand-primary opacity-0 group-hover:opacity-100 group-hover:translate-x-2 transition-all"
                        >→</span
                    >
                </div>
            </a>
        {/each}
    </div>
</div>
