Date: Wed, 12 Jul 2017 16:47:35 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] remoteproc: Add remote processor coredump support
Message-ID: <20170712234735.GJ20973@minitux>
References: <1497463616-19868-1-git-send-email-spjoshi@codeaurora.org>
 <0c2fe4e0-2aee-fcf4-0a49-5651241e1f9e@ti.com>
 <6d3c396a-31c9-6c58-0940-767997d03595@codeaurora.org>
 <63337ed3-12fe-840b-7efd-50e17bbe19dc@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63337ed3-12fe-840b-7efd-50e17bbe19dc@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: Sarangdhar Joshi <spjoshi@codeaurora.org>, Ohad Ben-Cohen <ohad@wizery.com>, Loic Pallardy <loic.pallardy@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Trilok Soni <tsoni@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 21 Jun 13:54 PDT 2017, Suman Anna wrote:
[..]
> >>> diff --git a/drivers/remoteproc/qcom_common.c
> >>> b/drivers/remoteproc/qcom_common.c
[..]
> >>> +int qcom_register_dump_segments(struct rproc *rproc,
> >>> +                const struct firmware *fw)
> >>> +{
> >>> +    struct rproc_dump_segment *segment;
> >>> +    const struct elf32_phdr *phdrs;
> >>> +    const struct elf32_phdr *phdr;
> >>> +    const struct elf32_hdr *ehdr;
> >>> +    int i;
> >>> +
> >>> +    ehdr = (struct elf32_hdr *)fw->data;
> >>> +    phdrs = (struct elf32_phdr *)(ehdr + 1);
> >>> +
> >>> +    for (i = 0; i < ehdr->e_phnum; i++) {
> >>> +        phdr = &phdrs[i];
> >>> +
> >>> +        if (!mdt_phdr_valid(phdr))
> >>> +            continue;
> >>> +
> >>> +        segment = kzalloc(sizeof(*segment), GFP_KERNEL);
> >>> +        if (!segment)
> >>> +            return -ENOMEM;
> >>> +
> >>> +        segment->da = phdr->p_paddr;
> >>> +        segment->size = phdr->p_memsz;
> >>> +
> >>> +        list_add_tail(&segment->node, &rproc->dump_segments);
> >>> +    }
> >>> +
> >>> +    return 0;
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(qcom_register_dump_segments);
> 
> So looking at this again, this only captures the segments dictated by
> your ELF program headers. So, will this be capturing the data contents
> like stack and heap.
> 

The ELF program header generally describes the segments for bss, stack
and heap in addition to the code and data segments.

Are you saying that your ELF header does not cover all the memory
segments used by the running firmware?


That said, this is the case for the Qualcomm driver. Per Sarangdhar's
suggestion your driver could register any chunks of memory; e.g. your
imem/dmem and you will get an ELF file with these two chunks defined.

[..]
> >>> +static int rproc_coredump_add_header(struct rproc *rproc)
> >>> +{
[..]
> >>> +    wait_for_completion_interruptible(&rproc->dump_complete);
> >>
> >> Hmm, is this holding up the recovery? I see this is signaled only in
> >> rproc_coredump_free()? You are doing this inline during the recovery
> >> or am I missing something?
> > 
> > Yes, that's right. The free() callback will complete the dump_complete
> > and then the rest of the recovery will proceed. This free() callback
> > gets called either when user writes to the .../devcoredump/data node or
> > devcoredump TIMEOUT (i.e. 5 mins) occurs. If CONFIG_DEV_COREDUMP is not
> > enabled, then this function will bailout without halting.
> 
> OK, but this fundamentally requires that there's some userspace utility
> that needs to trigger the continuation of recovery. Granted that this
> only happens CONFIG_DEV_COREDUMP is enabled, but that is a global build
> flag and when enabled does it for all the platforms as well. 5 mins is a
> long time if there's no utility, and if this path is enabled by default
> in a common kernel, it definitely is not a desirable default behavior.

I do agree with this. The alternative would be to have a utility having
some file open all the time, waiting for a crash to happen and the code
can detect if that's present or not.

But that wouldn't allow us to reuse the devcoredump mechanism, which I
would prefer not to duplicate. I also like the idea of having a single
knob for disabling core dump generation.


And as we all know the firmware will not crash we would end up wasting
resources sitting there waiting forever ;)

> What's the default behavior on individual coredumps when above is
> enabled. Also, how does the utility get to know that a remoteproc has
> crashed?
> 

The newly created devcoredump device will emit uevents, so with
appropriate udev plumbing you can hit it automatically launch your
utility to extract the content.

Regards,
Bjorn
