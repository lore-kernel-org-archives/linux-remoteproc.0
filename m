Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 14 Dec 2017 11:47:47 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 6/8] remoteproc: Move resource table load logic to find
Message-ID: <20171214194747.GV17344@builder>
References: <20171213224111.17864-1-bjorn.andersson@linaro.org>
 <20171213224111.17864-7-bjorn.andersson@linaro.org>
 <04d54471292f446898fd162afd15388f@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04d54471292f446898fd162afd15388f@SFHDAG7NODE2.st.com>
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 14 Dec 04:00 PST 2017, Loic PALLARDY wrote:
> > -----Original Message-----
> > From: linux-remoteproc-owner@vger.kernel.org [mailto:linux-remoteproc-
> > owner@vger.kernel.org] On Behalf Of Bjorn Andersson
[..]
> > +int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw)
> >  {
> >  	struct elf32_hdr *ehdr;
> >  	struct elf32_shdr *shdr;
> >  	struct device *dev = &rproc->dev;
> >  	struct resource_table *table = NULL;
> >  	const u8 *elf_data = fw->data;
> > +	size_t tablesz;
> > 
> >  	ehdr = (struct elf32_hdr *)elf_data;
> > 
> >  	shdr = find_table(dev, ehdr, fw->size);
> >  	if (!shdr)
> > -		return NULL;
> > +		return -EINVAL;
> Reading patch 7, I don't catch how firmware without resource table are
> supported as if no table found, an error is returned here.
> In rproc_fw_boot, you have:
> 	ret = rproc_load_rsc_table(rproc, fw);
> 	if (ret)
> 		goto disable_iommu;
> So boot process is interrupted...
> 

When a driver registers a remoteproc with load_rsc_table specified that
implies that the resource table is not optional as such it's an error to
not find one.

A driver that expects to load firmware without a resource table, such as
st_slim_rproc with it's dummy resource table would set load_rsc_table to
NULL.


So the purpose is to maintain the current requirements, with the
addition of removing the dummy implementations of find_rsc_table.

Regards,
Bjorn
