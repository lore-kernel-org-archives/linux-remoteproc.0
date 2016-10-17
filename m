Return-Path: <sunnyliangjy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161017122551.GA25418@Sanchayan-Arch.localdomain>
References: <20161006073023.GA1560@Sanchayan-Arch.localdomain>
 <20161014054325.GE8247@tuxbot> <20161017122551.GA25418@Sanchayan-Arch.localdomain>
From: Wendy Liang <sunnyliangjy@gmail.com>
Date: Mon, 17 Oct 2016 10:52:14 -0700
Message-ID: <CAA07jV9w9_+S62Gv7WM2Kn-=6CNXy8mMEhOkGLKf3h2tGpFrSA@mail.gmail.com>
Subject: Re: Query on vring allocation in internal SRAM with remoteproc
Content-Type: text/plain; charset=UTF-8
To: maitysanchayan@gmail.com
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, sanchayan.maity@toradex.com, stefan.agner@toradex.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello Sanchayan,

On Mon, Oct 17, 2016 at 5:25 AM,  <maitysanchayan@gmail.com> wrote:
> Hello,
>
> On 16-10-13 22:43:25, Bjorn Andersson wrote:
>> On Thu 06 Oct 00:30 PDT 2016, maitysanchayan@gmail.com wrote:
>>
>> > Hello,
>> >
>>
>> Hi Sanchayan
>>
>> > I have been working on use of remoteproc and rmpsg for bootup and communication
>> > between A5 and M4 core on NXP Vybrid[1]. Currently we are using a hacked up rpmsg[2]
>> > implementation for Vybrid based on NXP's implementation in downstream kernel for iMX7.
>>
>> Looks like the main difference is the allocation strategy for the vrings.
>>
>> > We also use remoteproc but currently only for booting the M4 core and would like to
>> > completely leverage remoteproc for booting and rpmsg communication instead of hacked
>> > up way, so we can also upstream this.
>> >
>>
>> Sounds good.
>>
>> > For Vybrid, currently the internal On-chip RAM is being used for the vrings. Initially
>> > I tried with remoteproc, but Linux remoteproc allocates vrings in it's memory space
>> > with a call to dma_alloc_coherent. This does not work for Vybrid's case as even using
>> > RSC_VDEV, rproc_handle_vdev dynamically allocates using DMA API and completely ignores
>> > requested hardcoded addresses. On M4 side, we use FreeRTOS and openamp which has
>> > support for rpmsg and remoteproc.
>> >
>>
>> Can you please describe why this doesn't work? Why do you need the
>> vrings to be allocated in on-chip RAM?
>>
>> I presume you use the virtio_rpmsg_bus implementation, which would end
>> up allocating the actual communication buffers with dma_alloc_coherent()
>> later anyways - so why use expensive on-chip memory for the vrings?
>>
>
> The primary requirement is that the memory allocated by dma_alloc_coherent
> needs to be communicated to the firmware on the remote processor. I have
> no idea at the moment how to achieve this but I guess this would be not
> trivial? We use FreeRTOS + OpenAMP on remote processor and using memory
> allocated at run time means I need to have some way of telling FreeRTOS +
> OpenAMP which memory location to use for vrings. As far as I can see
> currently there is no way of dynamically telling the OpenAMP stack the
> location of vrings or shared memory, unless I am missing something.
[Wendy] OpenAMP can parse the resource table, if you use remoteproc
from Linux kernel to boot the FreeRTOS + OpenAMP firmware. Before
linux kernel boot the firmware, it will setup the vrings. At run time,
the firmware can know where the buffers are from the buffer
descriptors in the vrings.

For shared memory, do you also need to know where the shared memory
are beforehand in order to enable access to those memory?

Best Regards,
Wendy

>
> On iMX7 it might be achievable as the A7 and M4 core share certain 32 bit
> registers. On Vybrid, there are no such registers shared between the
> cores.
>
> Regards,
> Sanchayan.
>
>> > The comment with rproc_handle_vdev mentions to use RSC_DEVMEM to map the required da
>> > to physical address. Reading the comments along with fw_rsc_devmem and above, I am
>> > not clear on what the firmware resource table should be. If I want the known internal
>> > OCRAM addresses to be used, shall I specify da and pa same in firmware resource table
>> > while using RSC_DEVMEM? Am not exactly clear on how the vrings will be allocated and
>> > handled in this case. It seems to have calls to iommu while we have no iommu.
>> >
>>
>> Ignore that ;) Let's try to figure out why you need this and how we can
>> support it in a proper way instead (you're not the only one stating this
>> need)
>>
>> > There seems to have been patches for exactly this usecase of internal memories [3]
>> > using ioremap_nocache, but that seems to have never made it through?
>> >
>>
>> Thanks for the link, I have not seen that patch before. In the
>> recent discussions on the topic I suggested that instead of trusting the
>> resource table we would make it possible for the remoteproc driver to
>> register ioremapped "carveouts".
>>
>> But as its presented it would allow for positioning data and code
>> segments like this, but further work is needed for this to back vrings
>> (I have some ideas on this though...)
>>
>> Regards,
>> Bjorn
>>
>> > Thanks & Regards,
>> > Sanchayan.
>> >
>> > [1]. http://www.nxp.com/products/microcontrollers-and-processors/arm-processors/vfxxx-controller/f-series/arm-cortex-a5-plus-cortex-m4-mpus-1.5-mb-sram-lcd-security-ethernet-l2-switch:VF6xx
>> > [2]. https://lkml.org/lkml/2016/1/6/182
>> > [3]. http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/270534.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remoteproc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
