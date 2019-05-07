Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [RFC PATCH] rproc: Add elf64 support in elf loader
References: <200341833.8193594.1554193736818.JavaMail.zimbra@kalray.eu>
 <2077801405.670546.1557230986215.JavaMail.zimbra@kalray.eu>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <04be3345-698d-29b0-7b4b-7eed088e490d@st.com>
Date: Tue, 7 May 2019 15:37:14 +0200
MIME-Version: 1.0
In-Reply-To: <2077801405.670546.1557230986215.JavaMail.zimbra@kalray.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Cl=c3=a9ment_Leger?= <cleger@kalray.eu>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Loic PALLARDY <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Clément,

I tested your patch on stm32MP1, no regression observed when loading my
ELF32 firmware.
Now i'm not enough expert on the loader to ack your patch.
For stm32 MP1 platform:
Tested-by: Arnaud POULIQUEN <arnaud.pouliquen@st.com>

Please find few remarks in your code

Regards
Arnaud

On 5/7/19 2:09 PM, Clément Leger wrote:
> Ping ?
> 
> ----- Original Message -----
> From: "Clément Leger" <cleger@kalray.eu>
> To: "linux-remoteproc" <linux-remoteproc@vger.kernel.org>, "Ohad Ben-Cohen" <ohad@wizery.com>, "Bjorn Andersson" <bjorn.andersson@linaro.org>
> Cc: "Loic PALLARDY" <loic.pallardy@st.com>
> Sent: Tuesday, 2 April, 2019 10:28:56
> Subject: [RFC PATCH] rproc: Add elf64 support in elf loader
> 
> elf32 and elf64 mainly differ by their types. In order to avoid
> copy/pasting the whole loader code, generate static inline functions
> which will access values according to the elf class. It allows to keep a
> common loader basis.
> In order to accomodate both elf types sizes, the maximum size for a
> elf header member is chosen using the maximum value of both elf class.
> 
> Signed-off-by: Clement Leger <clement.leger@kalray.eu>
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 130 +++++++++++++++++------------
>  drivers/remoteproc/remoteproc_elf_loader.h |  78 +++++++++++++++++
>  drivers/remoteproc/remoteproc_internal.h   |   2 +-
>  include/linux/remoteproc.h                 |   4 +-
>  4 files changed, 159 insertions(+), 55 deletions(-)
>  create mode 100644 drivers/remoteproc/remoteproc_elf_loader.h
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index b17d72ec8603..f6aefa46e45c 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -31,6 +31,7 @@
>  #include <linux/elf.h>
>  
>  #include "remoteproc_internal.h"
> +#include "remoteproc_elf_loader.h"
>  
>  /**
>   * rproc_elf_sanity_check() - Sanity Check ELF firmware image
> @@ -44,7 +45,10 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  	const char *name = rproc->firmware;
>  	struct device *dev = &rproc->dev;
>  	struct elf32_hdr *ehdr;
This is confusing because this function handles elf64 and elf32, i
suggest using  e_ident table pointer directly, or adding a comment as in
remoteproc_elf_loader.h
> +	u32 elf_shdr_size;
> +	u64 phoff, shoff;
>  	char class;
> +	u16 phnum;
>  
>  	if (!fw) {
>  		dev_err(dev, "failed to load %s\n", name);
> @@ -58,9 +62,13 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  
>  	ehdr = (struct elf32_hdr *)fw->data;
>  
> -	/* We only support ELF32 at this point */
> +	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
> +		dev_err(dev, "Image is corrupted (bad magic)\n");
> +		return -EINVAL;
> +	}
> +
>  	class = ehdr->e_ident[EI_CLASS];
> -	if (class != ELFCLASS32) {
> +	if (class != ELFCLASS32 && class != ELFCLASS64) {
>  		dev_err(dev, "Unsupported class: %d\n", class);
>  		return -EINVAL;
>  	}
> @@ -75,26 +83,29 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
>  		return -EINVAL;
>  	}
>  
> -	if (fw->size < ehdr->e_shoff + sizeof(struct elf32_shdr)) {
> -		dev_err(dev, "Image is too small\n");
> -		return -EINVAL;
> -	}
> +	phoff = elf_hdr_e_phoff(class, fw->data);
> +	shoff = elf_hdr_e_shoff(class, fw->data);
> +	phnum =  elf_hdr_e_phnum(class, fw->data);
> +	elf_shdr_size = elf_size_of_shdr(class);
>  
> -	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
> -		dev_err(dev, "Image is corrupted (bad magic)\n");
> +	if (fw->size < shoff + elf_shdr_size) {
> +		dev_err(dev, "Image is too small\n");
>  		return -EINVAL;
>  	}
>  
> -	if (ehdr->e_phnum == 0) {
> +	if (phnum == 0) {
>  		dev_err(dev, "No loadable segments\n");
>  		return -EINVAL;
>  	}
>  
> -	if (ehdr->e_phoff > fw->size) {
> +	if (phoff > fw->size) {
>  		dev_err(dev, "Firmware size is too small\n");
>  		return -EINVAL;
>  	}
>  
> +	dev_dbg(dev, "Firmware is an elf%d file\n",
> +		class == ELFCLASS32 ? 32 : 64);
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(rproc_elf_sanity_check);
> @@ -110,11 +121,9 @@ EXPORT_SYMBOL(rproc_elf_sanity_check);
>   * Note that the boot address is not a configurable property of all remote
>   * processors. Some will always boot at a specific hard-coded address.
>   */
> -u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> +u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
>  {
> -	struct elf32_hdr *ehdr  = (struct elf32_hdr *)fw->data;
> -
> -	return ehdr->e_entry;
> +	return elf_hdr_e_entry(fw_elf_get_class(fw), fw->data);
>  }
>  EXPORT_SYMBOL(rproc_elf_get_boot_addr);
>  
> @@ -145,37 +154,41 @@ EXPORT_SYMBOL(rproc_elf_get_boot_addr);
>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct device *dev = &rproc->dev;
> -	struct elf32_hdr *ehdr;
> -	struct elf32_phdr *phdr;
> +	const void *ehdr, *phdr;
>  	int i, ret = 0;
> +	u16 phnum;
>  	const u8 *elf_data = fw->data;
> +	u8 class = fw_elf_get_class(fw);
> +	u32 elf_phdr_size = elf_size_of_phdr(class);
>  
> -	ehdr = (struct elf32_hdr *)elf_data;
> -	phdr = (struct elf32_phdr *)(elf_data + ehdr->e_phoff);
> +	ehdr = elf_data;
> +	phnum = elf_hdr_e_phnum(class, ehdr);
> +	phdr = elf_data + elf_hdr_e_phoff(class, ehdr);
>  
>  	/* go through the available ELF segments */
> -	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
> -		u32 da = phdr->p_paddr;
> -		u32 memsz = phdr->p_memsz;
> -		u32 filesz = phdr->p_filesz;
> -		u32 offset = phdr->p_offset;
> +	for (i = 0; i < phnum; i++, phdr += elf_phdr_size) {
> +		u64 da = elf_phdr_p_paddr(class, phdr);
> +		u64 memsz = elf_phdr_p_memsz(class, phdr);
> +		u64 filesz = elf_phdr_p_filesz(class, phdr);
> +		u64 offset = elf_phdr_p_offset(class, phdr);
> +		u32 type = elf_phdr_p_type(class, phdr);
>  		void *ptr;
>  
> -		if (phdr->p_type != PT_LOAD)
> +		if (type != PT_LOAD)
>  			continue;
>  
> -		dev_dbg(dev, "phdr: type %d da 0x%x memsz 0x%x filesz 0x%x\n",
> -			phdr->p_type, da, memsz, filesz);
> +		dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\n",
> +			type, da, memsz, filesz);
>  
>  		if (filesz > memsz) {
> -			dev_err(dev, "bad phdr filesz 0x%x memsz 0x%x\n",
> +			dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
>  				filesz, memsz);
>  			ret = -EINVAL;
>  			break;
>  		}
>  
>  		if (offset + filesz > fw->size) {
> -			dev_err(dev, "truncated fw: need 0x%x avail 0x%zx\n",
> +			dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
>  				offset + filesz, fw->size);
>  			ret = -EINVAL;
>  			break;
> @@ -184,14 +197,15 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  		/* grab the kernel address for this device address */
>  		ptr = rproc_da_to_va(rproc, da, memsz);
>  		if (!ptr) {
> -			dev_err(dev, "bad phdr da 0x%x mem 0x%x\n", da, memsz);
> +			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> +				memsz);
>  			ret = -EINVAL;
>  			break;
>  		}
>  
>  		/* put the segment where the remote processor expects it */
> -		if (phdr->p_filesz)
> -			memcpy(ptr, elf_data + phdr->p_offset, filesz);
> +		if (filesz)
> +			memcpy(ptr, elf_data + offset, filesz);
>  
>  		/*
>  		 * Zero out remaining memory for this segment.
> @@ -208,24 +222,32 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  }
>  EXPORT_SYMBOL(rproc_elf_load_segments);
>  
> -static struct elf32_shdr *
> -find_table(struct device *dev, struct elf32_hdr *ehdr, size_t fw_size)
> +static const void *
> +find_table(struct device *dev, const struct firmware *fw)
>  {
> -	struct elf32_shdr *shdr;
> +	const void *shdr, *name_table_shdr;
>  	int i;
>  	const char *name_table;
>  	struct resource_table *table = NULL;
> -	const u8 *elf_data = (void *)ehdr;
> +	const u8 *elf_data = (void *)fw->data;
> +	u8 class = fw_elf_get_class(fw);
> +	size_t fw_size = fw->size;
> +	const void *ehdr = elf_data;
> +	u16 shnum = elf_hdr_e_shnum(class, ehdr);
> +	u32 elf_shdr_size = elf_size_of_shdr(class);
> +	u16 shstrndx = elf_hdr_e_shstrndx(class, ehdr);
>  
>  	/* look for the resource table and handle it */
> -	shdr = (struct elf32_shdr *)(elf_data + ehdr->e_shoff);
> -	name_table = elf_data + shdr[ehdr->e_shstrndx].sh_offset;
> +	shdr = elf_data + elf_hdr_e_shoff(class, ehdr);
> +	name_table_shdr = shdr + (shstrndx * elf_shdr_size);
> +	name_table = elf_data + elf_shdr_sh_offset(class, name_table_shdr);
>  
> -	for (i = 0; i < ehdr->e_shnum; i++, shdr++) {
> -		u32 size = shdr->sh_size;
> -		u32 offset = shdr->sh_offset;
> +	for (i = 0; i < shnum; i++, shdr += elf_shdr_size) {
> +		u64 size = elf_shdr_sh_size(class, shdr);
> +		u64 offset = elf_shdr_sh_offset(class, shdr);
> +		u32 name = elf_shdr_sh_name(class, shdr);
>  
> -		if (strcmp(name_table + shdr->sh_name, ".resource_table"))
> +		if (strcmp(name_table + name, ".resource_table"))
>  			continue;
>  
>  		table = (struct resource_table *)(elf_data + offset);
> @@ -279,21 +301,21 @@ find_table(struct device *dev, struct elf32_hdr *ehdr, size_t fw_size)
>   */
>  int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw)
>  {
> -	struct elf32_hdr *ehdr;
> -	struct elf32_shdr *shdr;
> +	const void *shdr;
>  	struct device *dev = &rproc->dev;
>  	struct resource_table *table = NULL;
>  	const u8 *elf_data = fw->data;
>  	size_t tablesz;
> +	u8 class = fw_elf_get_class(fw);
> +	u64 sh_offset;
>  
> -	ehdr = (struct elf32_hdr *)elf_data;
> -
> -	shdr = find_table(dev, ehdr, fw->size);
> +	shdr = find_table(dev, fw);
>  	if (!shdr)
>  		return -EINVAL;
>  
> -	table = (struct resource_table *)(elf_data + shdr->sh_offset);
> -	tablesz = shdr->sh_size;
> +	sh_offset = elf_shdr_sh_offset(class, shdr);
> +	table = (struct resource_table *)(elf_data + sh_offset);
> +	tablesz = elf_shdr_sh_size(class, shdr);
>  
>  	/*
>  	 * Create a copy of the resource table. When a virtio device starts
> @@ -326,13 +348,17 @@ EXPORT_SYMBOL(rproc_elf_load_rsc_table);
>  struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
>  						       const struct firmware *fw)
>  {
> -	struct elf32_hdr *ehdr = (struct elf32_hdr *)fw->data;
> -	struct elf32_shdr *shdr;
> +	const void *shdr;
> +	u64 sh_addr, sh_size;
> +	u8 class = fw_elf_get_class(fw);
>  
> -	shdr = find_table(&rproc->dev, ehdr, fw->size);
> +	shdr = find_table(&rproc->dev, fw);
>  	if (!shdr)
>  		return NULL;
>  
> -	return rproc_da_to_va(rproc, shdr->sh_addr, shdr->sh_size);
> +	sh_addr = elf_shdr_sh_addr(class, shdr);
> +	sh_size = elf_shdr_sh_size(class, shdr);
> +
> +	return rproc_da_to_va(rproc, sh_addr, sh_size);
>  }
>  EXPORT_SYMBOL(rproc_elf_find_loaded_rsc_table);
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.h b/drivers/remoteproc/remoteproc_elf_loader.h
> new file mode 100644
> index 000000000000..e37a55c61eae
> --- /dev/null
> +++ b/drivers/remoteproc/remoteproc_elf_loader.h
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Remote processor elf loader defines
> + *
> + * Copyright (C) 2019 Kalray, Inc.
The rest of the header should be cleaned
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef REMOTEPROC_ELF_LOADER_H
> +#define REMOTEPROC_ELF_LOADER_H
> +
> +#include <linux/elf.h>
> +#include <linux/types.h>
> +
> +/**
> + * fw_elf_get_class - Get elf class
> + * @fw: the ELF firmware image
> + *
> + * Note that we use and elf32_hdr to access the class since the start of the
> + * struct is the same for both elf class
> + *
> + * Return: elf class of the firmware
> + */
> +static inline u8 fw_elf_get_class(const struct firmware *fw)
> +{
> +	struct elf32_hdr *ehdr = (struct elf32_hdr *)fw->data;
> +
> +	return ehdr->e_ident[EI_CLASS];
> +}
> +
> +#define ELF_GET_FIELD(__s, __field, __type) \
> +static inline __type elf_##__s##_##__field(u8 class, const void *arg) \
> +{ \
> +	if (class == ELFCLASS32) \
> +		return (__type) ((const struct elf32_##__s *) arg)->__field; \
> +	else \
> +		return (__type) ((const struct elf64_##__s *) arg)->__field; \
> +}
> +
> +ELF_GET_FIELD(hdr, e_entry, u64)
> +ELF_GET_FIELD(hdr, e_phnum, u16)
> +ELF_GET_FIELD(hdr, e_shnum, u16)
> +ELF_GET_FIELD(hdr, e_phoff, u64)
> +ELF_GET_FIELD(hdr, e_shoff, u64)
> +ELF_GET_FIELD(hdr, e_shstrndx, u16)
> +
> +ELF_GET_FIELD(phdr, p_paddr, u64)
> +ELF_GET_FIELD(phdr, p_filesz, u64)
> +ELF_GET_FIELD(phdr, p_memsz, u64)
> +ELF_GET_FIELD(phdr, p_type, u32)
> +ELF_GET_FIELD(phdr, p_offset, u64)
> +
> +ELF_GET_FIELD(shdr, sh_size, u64)
> +ELF_GET_FIELD(shdr, sh_offset, u64)
> +ELF_GET_FIELD(shdr, sh_name, u32)
> +ELF_GET_FIELD(shdr, sh_addr, u64)
> +
> +#define ELF_STRUCT_SIZE(__s) \
> +static inline unsigned long elf_size_of_##__s(u8 class) \
> +{ \
> +	if (class == ELFCLASS32)\
> +		return sizeof(struct elf32_##__s); \
> +	else \
> +		return sizeof(struct elf64_##__s); \
> +}
> +
> +ELF_STRUCT_SIZE(shdr)
> +ELF_STRUCT_SIZE(phdr)
> +
> +#endif /* REMOTEPROC_ELF_LOADER_H */
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index b02b15f74a5e..6d4a5ffcb28b 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -55,7 +55,7 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, int len);
>  int rproc_trigger_recovery(struct rproc *rproc);
>  
>  int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw);
> -u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
> +u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
>  int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw);
>  struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index a3edd981220e..9a7c4c3f1c92 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -381,7 +381,7 @@ struct rproc_ops {
>  				struct rproc *rproc, const struct firmware *fw);
>  	int (*load)(struct rproc *rproc, const struct firmware *fw);
>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
> -	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> +	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>  };
>  
>  /**
> @@ -497,7 +497,7 @@ struct rproc {
>  	int num_traces;
>  	struct list_head carveouts;
>  	struct list_head mappings;
> -	u32 bootaddr;
> +	u64 bootaddr;
This generates a warning in remote proc:
drivers/remoteproc/st_remoteproc.c:196:24: warning: format ‘%x’ expects
argument of type ‘unsigned int’, but argument 3 has type ‘u64’ {aka
‘long long unsigned int’} [-Wformat=]
  dev_info(&rproc->dev, "Started from 0x%x\n", rproc->bootaddr);
>  	struct list_head rvdevs;
>  	struct list_head subdevs;
>  	struct idr notifyids;
> 
