Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 15 Feb 2017 22:01:18 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/5] remoteproc: qcom: mdt_loader: Refactor MDT loader
Message-ID: <20170216060118.GC23255@minitux>
References: <20170130165547.4344-1-bjorn.andersson@linaro.org>
 <20170130165547.4344-3-bjorn.andersson@linaro.org>
 <156a64cf-0efa-2313-f8bd-f948a108df19@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156a64cf-0efa-2313-f8bd-f948a108df19@linaro.org>
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 08 Feb 02:33 PST 2017, Stanimir Varbanov wrote:

> Hi Bjorn,
> 
> On 01/30/2017 06:55 PM, Bjorn Andersson wrote:
[..]
> > +int qcom_mdt_load(struct device *dev, const struct firmware *fw,
[..]
> > +	size_t offset;
[..]
> > +	for (i = 0; i < ehdr->e_phnum; i++) {
> > +		phdr = &phdrs[i];
> > +
> > +		if (!mdt_phdr_valid(phdr))
> >  			continue;
> >  
> > -		ptr = rproc_da_to_va(rproc, phdr->p_paddr, phdr->p_memsz);
> > -		if (!ptr) {
> > -			dev_err(&rproc->dev, "segment outside memory range\n");
> > +		offset = phdr->p_paddr - mem_reloc;
> 
> Shouldn't 'offset' variable be of signed type i.e. ssize_t?

It should, as a small "negative" value will wrap back into the
acceptable range of the second part of the check below. I got another
report of this as well yesterday, so I will prepare a patch for this.

> Also p_paddr is of type Elf32_Addr and mem_reloc is of type
> phys_addr_t which on 64bit systems is 64bit long, I think it should be
> better to make mem_reloc of the same type as p_paddr.
> 

If I remember what the C standard says, mem_reloc would in the 64-bit
case have higher "rank" and the type of p_paddr would therefor be
converted to the type of mem_reloc (i.e.  u64) and the result would be
stored in a 64 bit type. But it's been a while and I can't find my C
reference manual right now...

Casting mem_reloc to the type of p_paddr would cause invalid results in
the event that the system is configured to actually load a relocatable
blob into memory above 4GB.

> > +		if (offset < 0 || offset + phdr->p_memsz > mem_size) {
> > +			dev_err(dev, "segment outside memory range\n");
> >  			ret = -EINVAL;
> >  			break;
> >  		}
> >  
> > +		ptr = mem_region + offset;
> > +
> >  		if (phdr->p_filesz) {
> >  			sprintf(fw_name + fw_name_len - 3, "b%02d", i);
> > -			ret = request_firmware(&seg_fw, fw_name, &rproc->dev);
> > +			ret = request_firmware(&seg_fw, fw_name, dev);
> >  			if (ret) {
> > -				dev_err(&rproc->dev, "failed to load %s\n",
> > -					fw_name);
> > +				dev_err(dev, "failed to load %s\n", fw_name);
> >  				break;
> >  			}
> >  
> 

Regards,
Bjorn
