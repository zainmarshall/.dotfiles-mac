<script lang="ts">
    let { project } = $props();
</script>

<div
    class="group relative bg-brand-surface rounded-[2.5rem] overflow-hidden border border-white/5 hover:border-brand-primary/30 transition-all duration-700 hover:-translate-y-3"
>
    <!-- Image Container -->
    <div class="aspect-[16/10] overflow-hidden relative">
        <img
            src={project.image}
            alt={project.title}
            class="w-full h-full object-cover transition-all duration-1000 group-hover:scale-110 grayscale-[0.5] group-hover:grayscale-0"
        />
        <div
            class="absolute inset-0 bg-gradient-to-t from-brand-surface via-transparent to-transparent opacity-60"
        ></div>
    </div>

    <!-- Content -->
    <div class="p-10 relative z-10">
        <div class="flex flex-wrap gap-2 mb-8">
            {#each project.tags as tag}
                <span
                    class="px-4 py-1.5 rounded-xl text-[10px] font-black bg-white/5 text-brand-muted uppercase tracking-[0.15em] border border-white/5 group-hover:border-brand-primary/20 group-hover:text-brand-primary transition-all"
                >
                    {tag}
                </span>
            {/each}
        </div>

        <h3
            class="text-4xl font-black mb-4 tracking-tighter group-hover:text-brand-primary transition-colors leading-none"
        >
            {project.title}
        </h3>
        <p
            class="text-brand-muted text-lg leading-relaxed mb-10 line-clamp-2 font-medium opacity-70 group-hover:opacity-100 transition-opacity"
        >
            {project.description}
        </p>

        <a
            href={project.link}
            class="group/link inline-flex items-center gap-4 text-xs font-black uppercase tracking-[0.2em] text-brand-primary"
        >
            Explore Project
            <div
                class="relative w-10 h-[2px] bg-brand-primary/20 overflow-hidden"
            >
                <div
                    class="absolute inset-0 bg-brand-primary -translate-x-full group-hover/link:translate-x-0 transition-transform duration-500"
                ></div>
            </div>
        </a>
    </div>

    <!-- Background Glow -->
    <div
        class="absolute -bottom-20 -right-20 w-64 h-64 bg-brand-primary/5 rounded-full blur-[100px] opacity-0 group-hover:opacity-100 transition-opacity duration-1000"
    ></div>
</div>
