<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreForumThreadRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return auth()->check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $rules = [
            'title' => 'required|string|min:5|max:255',
            'content' => 'required|string|min:10|max:10000'
        ];

        // Add forum_id validation when creating thread with category selection
        if ($this->routeIs('forum.threads.store.category')) {
            $rules['forum_id'] = 'required|exists:forums,id';
        }

        return $rules;
    }

    /**
     * Get custom messages for validator errors.
     */
    public function messages(): array
    {
        return [
            'title.required' => 'Judul thread harus diisi.',
            'title.min' => 'Judul thread minimal 5 karakter.',
            'title.max' => 'Judul thread maksimal 255 karakter.',
            'content.required' => 'Isi thread harus diisi.',
            'content.min' => 'Isi thread minimal 10 karakter.',
            'content.max' => 'Isi thread maksimal 10.000 karakter.',
            'forum_id.required' => 'Kategori forum harus dipilih.',
            'forum_id.exists' => 'Kategori forum yang dipilih tidak valid.'
        ];
    }
}
