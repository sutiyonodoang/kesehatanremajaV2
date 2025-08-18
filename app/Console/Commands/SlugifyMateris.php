<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Materi;
use Illuminate\Support\Str;

class SlugifyMateris extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'materi:slugify';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Generate slugs for existing materials';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $materis = Materi::all();

        foreach ($materis as $materi) {
            $materi->slug = Str::slug($materi->judul);
            $materi->save();
        }

        $this->info('Successfully generated slugs for all materials.');
    }
}
