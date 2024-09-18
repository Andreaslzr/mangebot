<script setup lang="ts">
  import { PartsResponse, type PartsResponseType, Part } from '@/models/Parts';
  import { getParts } from '@/services/part.service';
  import { type Ref, ref } from 'vue';
  import PartSelector from '@/components/PartSelector.vue';
  
//   try{
//       const parts = await getParts();
//   }
//   catch(error){
//     console.error(error)
//   }
  const availableParts: Ref<PartsResponse> = ref(new PartsResponse());
  
  const selectedHead: Ref<Part|null> = ref(null);
  const selectedLeftArm: Ref<Part|null> = ref(null);
  const selectedRightArm: Ref<Part|null> = ref(null);
  const selectedTorso: Ref<Part|null> = ref(null);
  const selectedBase: Ref<Part|null> = ref(null);

getParts()
    .then(parts=>{
      availableParts.value = parts;

      selectedHead.value = parts.heads[0] ?? null;
      selectedLeftArm.value = parts.arms[0] ?? null;
      selectedRightArm.value = parts.arms[0] ?? null;
      selectedTorso.value = parts.torsos[0] ?? null;
      selectedBase.value = parts.bases[0] ?? null;
    })
    .catch(error=>console.error(error));
  
const addCart = ()=> {
  console.log("Adicionado no carrinho os seguintes itens:");
  console.log("Head: ", selectedHead.value);
  console.log("LeftArm: ", selectedLeftArm.value);
  console.log("RightArm: ", selectedRightArm.value);
  console.log("Torso: ", selectedTorso.value);
  console.log("Base: ", selectedBase.value);
} 

</script>

<template>
    <div>
        <h1 class="text-center mb-2">{{ $t('BUILD.TITLE') }}</h1>         
        <section class="top-row">
          <PartSelector
          :parts="availableParts.heads"
          position="top"
          v-model="selectedHead"          
          />
        </section>
        <section class="middle-row">
          <PartSelector
          :parts="availableParts.arms"
          position="left"
          v-model="selectedLeftArm"
          />
          <PartSelector
          :parts="availableParts.torsos"
          position="center"
          v-model="selectedTorso"
          />
          <PartSelector
          :parts="availableParts.arms"
          position="right"
          v-model="selectedRightArm"
          />
        </section>
        <section class="bottom-row">
          <PartSelector
          :parts="availableParts.bases"
          position="bottom"
          v-model="selectedBase"
          />
        </section> 
        <div class="flex flex-row align-items-center justify-content-center">
          <button @click="addCart" id="add-cart" class="mt-4 app-dark-button">
            {{ $t('BUILD.ADD_CART') }}
          </button>
        </div>       
      </div>
      
</template>

<style scoped lang="scss">

#add-cart{
  padding: 0.5rem 1rem;
}

.top-row{
  display: flex;
  justify-content: space-around;
}

.middle-row{
  display: flex;
  justify-content: center;
}

.bottom-row{
  display: flex;
  justify-content: space-around;
}


</style>