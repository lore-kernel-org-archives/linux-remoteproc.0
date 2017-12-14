Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 14 Dec 2017 11:25:29 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 6/8] remoteproc: Move resource table load logic to find
Message-ID: <20171214192529.GU17344@builder>
References: <20171213224111.17864-1-bjorn.andersson@linaro.org>
 <20171213224111.17864-7-bjorn.andersson@linaro.org>
 <63583c92f9e14fd881d53db2706ca689@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63583c92f9e14fd881d53db2706ca689@SFHDAG7NODE2.st.com>
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 14 Dec 03:25 PST 2017, Loic PALLARDY wrote:
> > -----Original Message-----
> > From: linux-remoteproc-owner@vger.kernel.org [mailto:linux-remoteproc-
> > owner@vger.kernel.org] On Behalf Of Bjorn Andersson
> > Sent: Wednesday, December 13, 2017 11:41 PM
[..]
> > -struct resource_table *rproc_elf_find_rsc_table(struct rproc *rproc,
> > -						const struct firmware *fw,
> > -						int *tablesz)
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
> > 
> >  	table = (struct resource_table *)(elf_data + shdr->sh_offset);
> > -	*tablesz = shdr->sh_size;
> > +	tablesz = shdr->sh_size;
> > +
> > +	/*
> > +	 * Create a copy of the resource table. When a virtio device starts
> > +	 * and calls vring_new_virtqueue() the address of the allocated vring
> > +	 * will be stored in the cached_table. Before the device is started,
> > +	 * cached_table will be copied into device memory.
> > +	 */
> > +	rproc->cached_table = kmemdup(table, tablesz, GFP_KERNEL);
> > +	if (!rproc->cached_table)
> > +		return -ENOMEM;
> > 
> > -	return table;
> > +	rproc->table_ptr = rproc->cached_table;
> > +	rproc->table_sz = tablesz;
> > +
> > +	return 0;
> >  }
> > -EXPORT_SYMBOL(rproc_elf_find_rsc_table);
> > +EXPORT_SYMBOL(rproc_elf_load_rsc_table);
> [LPA] Hi Bjorn,
> 
> I understand the simplification of the  code, but I would like to keep
> rproc_elf_find_rsc_table function as helper one.  Indeed if a driver
> wants to override the default rproc_elf_load_rsc_table, it may have to
> parse first the elf file to look up for resource table using
> rproc_elf_find_rsc_table as helper.

find_table() finds the .resource_table segment and verifies that this
contains a valid, version 1, resource table.

So AFAICT there are two scenarios here:
1) A driver wants to support custom entries in the resource table, for
which Suman's proposal of adding a way for drivers to implement custom
properties seems like a good solution.

2) A driver wants to support something other than a v1 resource table,
in which case they would need to reimplement find_table() anyways.


It's possible that the part of find_table() that looks up the segment by
name could be exposed for drivers to use this, but half of find_table()
deals with verifying that the content is a proper resource table.

Please let me know if you have a use case beyond these.

Regards,
Bjorn
