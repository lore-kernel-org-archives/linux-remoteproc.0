Return-Path: <pihsun@chromium.org>
MIME-Version: 1.0
References: <20190709072547.217957-1-pihsun@chromium.org> <20190709072547.217957-3-pihsun@chromium.org>
 <CAPBb6MUsKYsG2qYFsj8DhtAWipRw887nk_gi68Gt+DcuHzApgw@mail.gmail.com>
In-Reply-To: <CAPBb6MUsKYsG2qYFsj8DhtAWipRw887nk_gi68Gt+DcuHzApgw@mail.gmail.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Mon, 5 Aug 2019 18:31:26 +0800
Message-ID: <CANdKZ0cb8OZVjOb9j7ivCCs3afXgshFWgrYkkZJOrGkHNWcEPg@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] remoteproc/mediatek: add SCP support for mt8183
Content-Type: text/plain; charset="UTF-8"
To: Alexandre Courbot <acourbot@chromium.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Nicolas Boichat <drinkcat@chromium.org>, Erin Lo <erin.lo@mediatek.com>, "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Thanks for the review. I'll address most of the comments in the next version.

On Mon, Jul 22, 2019 at 5:37 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> Hi Pi-Hsun,
>
> On Tue, Jul 9, 2019 at 4:27 PM Pi-Hsun Shih <pihsun@chromium.org> wrote:
> > +static void *scp_da_to_va(struct rproc *rproc, u64 da, int len)
> > +{
> > +       struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
> > +       int offset;
> > +
> > +       if (da < scp->sram_size) {
> > +               offset = da;
> > +               if (offset >= 0 && ((offset + len) < scp->sram_size))
> > +                       return (__force void *)(scp->sram_base + offset);
> > +       } else if (da >= scp->sram_size &&
> > +                  da < (scp->sram_size + MAX_CODE_SIZE)) {
> > +               offset = da;
>
> This line looks suspicious. Shouldn't it be
>
>     offset = da - scp->sram_size?
>

Actually the whole "else if (...)" is not used. Would remove this in
next version.

> > +
> > +/*
> > + * Copy src to dst, where dst is in SCP SRAM region.
> > + * Since AP access of SCP SRAM don't support byte write, this always write a
> > + * full word at a time, and may cause some extra bytes to be written at the
> > + * beginning & ending of dst.
> > + */
> > +void scp_memcpy_aligned(void *dst, const void *src, unsigned int len)
> > +{
> > +       void *ptr;
> > +       u32 val;
> > +       unsigned int i = 0;
> > +
> > +       if (!IS_ALIGNED((unsigned long)dst, 4)) {
> > +               ptr = (void *)ALIGN_DOWN((unsigned long)dst, 4);
> > +               i = 4 - (dst - ptr);
> > +               val = readl_relaxed(ptr);
> > +               memcpy((u8 *)&val + (4 - i), src, i);
> > +               writel_relaxed(val, ptr);
> > +       }
> > +
> > +       while (i + 4 <= len) {
> > +               val = *((u32 *)(src + i));
> > +               writel_relaxed(val, dst + i);
>
> If dst is not aligned to 4, this is going to write to an address that
> is not a multiple of 4, even though it writes a long. Is this ok?
> Typically limitations in write size come with alignment limitations.
>

If dst is not aligned to 4, the first if (!IS_ALIGNED(...)) block
should make that the (dst + i) is a multiple of 4, so the write here
is aligned.

> > +               i += 4;
> > +       }
> > +       if (i < len) {
> > +               val = readl_relaxed(dst + i);
> > +               memcpy(&val, src + i, len - i);
> > +               writel_relaxed(val, dst + i);
> > +       }
> > +}
> > +EXPORT_SYMBOL_GPL(scp_memcpy_aligned);
>
> IIUC this function's symbol does not need to be exported since it is
> only used in the current kernel module.
>

I've tried to remove this EXPORT line, but then there would be error
while compiling:
ERROR: "scp_memcpy_aligned" [drivers/remoteproc/mtk_scp.ko] undefined!
I think it's because the mtk_scp.c and mtk_scp_ipi.c both use the
scp_memcpy_aligned, but is compiled as separate .o files. So the
EXPORT_SYMBOL is needed.
