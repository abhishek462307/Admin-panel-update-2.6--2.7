<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('store_configs', function (Blueprint $table) {
            $table->boolean('halal_tag_status')->default(0);
            $table->boolean('extra_packaging_status')->default(0);
            $table->double('extra_packaging_amount', 23, 3)->default(0);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('store_configs', function (Blueprint $table) {
            $table->dropColumn('halal_tag_status');
            $table->dropColumn('extra_packaging_status');
            $table->dropColumn('extra_packaging_amount');
        });
    }
};
