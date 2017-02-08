Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH 3/5] remoteproc: qcom: mdt_loader: Refactor MDT loader
References: <20170130165547.4344-1-bjorn.andersson@linaro.org>
 <20170130165547.4344-3-bjorn.andersson@linaro.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <156a64cf-0efa-2313-f8bd-f948a108df19@linaro.org>
Date: Wed, 8 Feb 2017 12:33:00 +0200
MIME-Version: 1.0
In-Reply-To: <20170130165547.4344-3-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 01/30/2017 06:55 PM, Bjorn Andersson wrote:
> Pushing the SCM calls into the MDT loader reduces duplication in the
> callers and allows for non-remoteproc clients to use the helper for
> parsing and loading MDT files.
> 
> Cc: Andy Gross <andy.gross@linaro.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/qcom_adsp_pil.c   |  29 +-------
>  drivers/remoteproc/qcom_mdt_loader.c | 134 +++++++++++++++++++++++------------
>  drivers/remoteproc/qcom_mdt_loader.h |   6 +-
>  drivers/remoteproc/qcom_q6v5_pil.c   |   4 +-
>  drivers/remoteproc/qcom_wcnss.c      |  29 +-------
>  5 files changed, 100 insertions(+), 102 deletions(-)
> 

>  /**
> - * qcom_mdt_load() - load the firmware which header is defined in fw
> - * @rproc:	rproc handle
> - * @fw:		frimware object for the header
> - * @firmware:	filename of the firmware, for building .bXX names
> + * qcom_mdt_load() - load the firmware which header is loaded as fw
> + * @dev:	device handle to associate resources with
> + * @fw:		firmware object for the mdt file
> + * @firmware:	name of the firmware, for construction of segment file names
> + * @pas_id:	PAS identifier
> + * @mem_region:	allocated memory region to load firmware into
> + * @mem_phys:	physical address of allocated memory region
> + * @mem_size:	size of the allocated memory region
>   *
>   * Returns 0 on success, negative errno otherwise.
>   */
> -int qcom_mdt_load(struct rproc *rproc,
> -		  const struct firmware *fw,
> -		  const char *firmware)
> +int qcom_mdt_load(struct device *dev, const struct firmware *fw,
> +		  const char *firmware, int pas_id, void *mem_region,
> +		  phys_addr_t mem_phys, size_t mem_size)
>  {
>  	const struct elf32_phdr *phdrs;
>  	const struct elf32_phdr *phdr;
>  	const struct elf32_hdr *ehdr;
>  	const struct firmware *seg_fw;
> +	phys_addr_t mem_reloc;
> +	phys_addr_t min_addr = (phys_addr_t)ULLONG_MAX;
> +	phys_addr_t max_addr = 0;
>  	size_t fw_name_len;
> +	size_t offset;
>  	char *fw_name;
> +	bool relocate = false;
>  	void *ptr;
>  	int ret;
>  	int i;
>  
> +	if (!fw || !mem_region || !mem_phys || !mem_size)
> +		return -EINVAL;
> +
>  	ehdr = (struct elf32_hdr *)fw->data;
>  	phdrs = (struct elf32_phdr *)(ehdr + 1);
>  
> @@ -134,31 +140,68 @@ int qcom_mdt_load(struct rproc *rproc,
>  	if (!fw_name)
>  		return -ENOMEM;
>  
> +	ret = qcom_scm_pas_init_image(pas_id, fw->data, fw->size);
> +	if (ret) {
> +		dev_err(dev, "invalid firmware metadata\n");
> +		goto out;
> +	}
> +
>  	for (i = 0; i < ehdr->e_phnum; i++) {
>  		phdr = &phdrs[i];
>  
> -		if (phdr->p_type != PT_LOAD)
> +		if (!mdt_phdr_valid(phdr))
>  			continue;
>  
> -		if ((phdr->p_flags & QCOM_MDT_TYPE_MASK) == QCOM_MDT_TYPE_HASH)
> -			continue;
> +		if (phdr->p_flags & QCOM_MDT_RELOCATABLE)
> +			relocate = true;
> +
> +		if (phdr->p_paddr < min_addr)
> +			min_addr = phdr->p_paddr;
> +
> +		if (phdr->p_paddr + phdr->p_memsz > max_addr)
> +			max_addr = ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K);
> +	}
> +
> +	if (relocate) {
> +		ret = qcom_scm_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
> +		if (ret) {
> +			dev_err(dev, "unable to setup relocation\n");
> +			goto out;
> +		}
> +
> +		/*
> +		 * The image is relocatable, so offset each segment based on
> +		 * the lowest segment address.
> +		 */
> +		mem_reloc = min_addr;
> +	} else {
> +		/*
> +		 * Image is not relocatable, so offset each segment based on
> +		 * the allocated physical chunk of memory.
> +		 */
> +		mem_reloc = mem_phys;
> +	}
>  
> -		if (!phdr->p_memsz)
> +	for (i = 0; i < ehdr->e_phnum; i++) {
> +		phdr = &phdrs[i];
> +
> +		if (!mdt_phdr_valid(phdr))
>  			continue;
>  
> -		ptr = rproc_da_to_va(rproc, phdr->p_paddr, phdr->p_memsz);
> -		if (!ptr) {
> -			dev_err(&rproc->dev, "segment outside memory range\n");
> +		offset = phdr->p_paddr - mem_reloc;

Shouldn't 'offset' variable be of signed type i.e. ssize_t? Also p_paddr
is of type Elf32_Addr and mem_reloc is of type phys_addr_t which on
64bit systems is 64bit long, I think it should be better to make
mem_reloc of the same type as p_paddr.

> +		if (offset < 0 || offset + phdr->p_memsz > mem_size) {
> +			dev_err(dev, "segment outside memory range\n");
>  			ret = -EINVAL;
>  			break;
>  		}
>  
> +		ptr = mem_region + offset;
> +
>  		if (phdr->p_filesz) {
>  			sprintf(fw_name + fw_name_len - 3, "b%02d", i);
> -			ret = request_firmware(&seg_fw, fw_name, &rproc->dev);
> +			ret = request_firmware(&seg_fw, fw_name, dev);
>  			if (ret) {
> -				dev_err(&rproc->dev, "failed to load %s\n",
> -					fw_name);
> +				dev_err(dev, "failed to load %s\n", fw_name);
>  				break;
>  			}
>  


-- 
regards,
Stan
