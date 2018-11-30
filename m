Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
References: <1543526968-56091-1-git-send-email-loic.pallardy@st.com> <1543526968-56091-5-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1543526968-56091-5-git-send-email-loic.pallardy@st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 30 Nov 2018 15:33:29 +0100
Message-ID: <CAK8P3a25Y3y1Zjtf18i6Tgt83npLvbCeBvcd-r1+u8ijp=X2Yw@mail.gmail.com>
Subject: Re: [PATCH 4/7] remoteproc: add warning on resource table cast
Content-Type: text/plain; charset="UTF-8"
To: Loic Pallardy <loic.pallardy@st.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Nov 29, 2018 at 10:31 PM Loic Pallardy <loic.pallardy@st.com> wrote:
>
> Today resource table supports only 32bit address fields.
> This is not compliant with 64bit platform for which addresses
> are cast in 32bit.
> This patch adds warn messages when address cast is done.
>
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 18a1bbf820c9..61c954bd695e 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -772,6 +772,10 @@ static int rproc_alloc_carveout(struct rproc *rproc,
>                 dev_dbg(dev, "carveout mapped 0x%x to %pad\n",
>                         mem->da, &dma);
>         } else {
> +               /* Update device address as undefined by requester */
> +               if (sizeof(dma_addr_t) > sizeof(u32))
> +                       dev_warn(dev, "DMA address cast in 32bit to fit resource table format\n");
> +
>                 mem->da = (u32)dma;
>         }

I think this patch is wrong: sizeof(dma_addr_t) is defined to be large enough
to support any machine that the kernel can run on. If you build a kernel that
happens to work on an ARM32 platform with LPAE enabled, then this will
warn every time, even if you are running on a machine that only has a 32-bit
address space.

     Arnd
