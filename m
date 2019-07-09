Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [EXT] Re: [RFC 2/2] rpmsg: imx: add the initial imx rpmsg support
References: <1561968784-1124-1-git-send-email-hongxing.zhu@nxp.com>
 <1561968784-1124-3-git-send-email-hongxing.zhu@nxp.com>
 <3e0a061c-4f5e-ac32-031d-909a48644265@pengutronix.de>
 <AM0PR0402MB35706FFBFD76FF81BCF5E6018CF60@AM0PR0402MB3570.eurprd04.prod.outlook.com>
 <e4629709-fbe7-6af9-3cee-309b2ec1892f@pengutronix.de>
 <fcdd6392-75f4-716d-5dbd-1828a679b25f@st.com>
 <AM0PR0402MB3570CF963122A44DF2F049E88CF10@AM0PR0402MB3570.eurprd04.prod.outlook.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <81f58f8f-9050-a6be-29c6-aab803cf5520@st.com>
Date: Tue, 9 Jul 2019 11:56:53 +0200
MIME-Version: 1.0
In-Reply-To: <AM0PR0402MB3570CF963122A44DF2F049E88CF10@AM0PR0402MB3570.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Richard Zhu <hongxing.zhu@nxp.com>, Oleksij Rempel <o.rempel@pengutronix.de>, "ohad@wizery.com" <ohad@wizery.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Cc: "loic.pallardy@st.com" <loic.pallardy@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "elder@linaro.org" <elder@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <linux-remoteproc@vger.kernel.org>



On 7/9/19 9:32 AM, Richard Zhu wrote:
> Hi Arnaud:
> Thanks a lot for your kindly guidance and review comments.
> 
> 
>> -----Original Message-----
>> From: Arnaud Pouliquen [mailto:arnaud.pouliquen@st.com]
>> Sent: 2019年7月8日 22:12
>> To: Oleksij Rempel <o.rempel@pengutronix.de>; Richard Zhu
>> <hongxing.zhu@nxp.com>; ohad@wizery.com; bjorn.andersson@linaro.org;
>> linux-remoteproc@vger.kernel.org
>> Cc: loic.pallardy@st.com; Fabien DESSENNE <fabien.dessenne@st.com>;
>> elder@linaro.org; linux-arm-kernel@lists.infradead.org
>> Subject: Re: [EXT] Re: [RFC 2/2] rpmsg: imx: add the initial imx rpmsg support
>>
>>
>> Hello Richard,
>>
>> On 7/8/19 1:02 PM, Oleksij Rempel wrote:
>>> Hi Richard,
>>>
>>> On 08.07.19 12:17, Richard Zhu wrote:
>>>> Hi Oleksij:
>>>> Thanks for your comments.
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
>>>>> Sent: 2019年7月4日 17:36
>>>>> To: Richard Zhu <hongxing.zhu@nxp.com>; ohad@wizery.com;
>>>>> bjorn.andersson@linaro.org; linux-remoteproc@vger.kernel.org
>>>>> Cc: linux-arm-kernel@lists.infradead.org; Fabien DESSENNE
>>>>> <fabien.dessenne@st.com>; loic.pallardy@st.com;
>>>>> arnaud.pouliquen@st.com; s-anna@ti.com; elder@linaro.org
>>>>> Subject: [EXT] Re: [RFC 2/2] rpmsg: imx: add the initial imx rpmsg
>>>>> support
>>>>>
>>>>>
>>>>> Hi Richard,
>>>>>
>>>>> On 01.07.19 10:34, Richard Zhu wrote:
>>>>>> Based on "virtio_rpmsg_bus" driver, This patch-set is used to set
>>>>>> up the communication mechanism between A core and M core on i.MX
>>>>>> AMP
>>>>> SOCs.
>>>>>>
>>>>>> Add the initial imx rpmsg support glue driver and one pingpong
>>>>>> demo, demonstrated the data transactions between A core and remote
>> M core.
>>>>>> Distributed framework is used in IMX RPMSG implementation, refer to
>>>>>> the following requirements:
>>>>>>     - The CAN functions contained in M core and RTOS should be
>>>>>> ready and
>>>>>>       complete functional in 50ms after AMP system is turned on.
>>>>>>     - Partition reset. System wouldn't be stalled by the exceptions
>>>>>> (e.x
>>>>>>       the reset triggered by the system hang) occurred at the other
>>>>>> side.
>>>>>>       And the RPMSG mechanism should be recovered automactilly
>>>>>> after
>>>>> the
>>>>>>       partition reset is completed.
>>>>>> In this scenario, the M core and RTOS would be kicked off by
>>>>>> bootloader firstly, then A core and Linux would be loaded later.
>>>>>> Both M core/RTOS and A core/Linux are running independly.
>>>>>>
>>>>>> One physical memory region used to store the vring is mandatory
>>>>>> required to pre-reserved and well-knowned by both A core and M core
>>>>>
>>>>> I don't see any thing imx specific in this patch. We already have
>>>>> remoteproc which would parse firmware header and create needed
>>>>> devices. This driver is only needed for the case where firmware was
>>>>> stared by the bootloader.
>>>>>
>>>> [Richard Zhu] Bootloader starts the firmware is mandatory required in
>>>> these scenario refer to the reasons listed in the commit.
>>>> Thus, the distributed framework has to be used, and both A core/Linux
>>>> and remote core/RTOS works independently.
>>>>
>>>>> I personally would prefer to have generic driver or extend the
>>>>> remoteproc framework. So we can notify kernel about work already
>>>>> done by bootloader.
>>>>>
>>>> [Richard Zhu] Thanks for your suggestions.
>>>> Regarding to my understand, it seems that master/slave mode is used
>>>> in the remoteproc currently.
>>>> A core/Linux acts as master, to controls/manipulates remote core/RTOS.
>>>> It isn't applicable for the scenario described by this patch-set.
>>>>
>>>>> In general, some more issues should be solved:
>>>>> - Handle or not touch idle clocks for different node used by M core
>>>>> and not main system.
>>>>> - pin control
>>>>> - regulators
>>>>>
>>>>> ST devs already tried to solve this issues by creating "remoteproc:
>>>>> add system
>>>>> resource manager device" patch. I don't know what is current state
>>>>> of it (/me adding ST devs to CC).
>> The resource manager implementation as been proposed but no real
>> adhesion of the community on it... Perhaps SCMI should be a candidate...
>>
>>>>>
>>>> [Richard Zhu] Yes, it is. Many contributions have been made by Fabien.
>>>> IMHO, there are some different behaviors on iMX8QXP/QM platforms, the
>>>>   resources (e.x IP modules) had been assigned and managed by the
>> XRDC.
>>>> In the other words, the HW resources would be assigned and managed
>> would
>>>>   be transparent to SW.
>>>>
>>>> Thus, both A core/Linux and M core/RTOS can work real independently.
>>>> System wouldn't be stalled by the exceptions (e.x the reset triggered
>>>> by the system hang) occurred at the other side. And the RPMSG
>>>> mechanism should
>>>>   be recovered automatically after the partition reset is completed.
>>>
>>> It is exactly the way I did understood it in the firs mail. Any way,
>>> i'm ok with this driver. Just rename imx to some thing generic. This
>>> driver can and will be reused on other platforms as well.
>>>
>>> Kind regards,
>>> Oleksij Rempel
>>>
>>
>> I'm trying to figure out what is the interest of these drivers vs existing ones.
>> Please find below a list of features i noticed in your driver (don't hesitate if i
>> missed some of them), with some comments/questions.
>>
>> 1) The coprocessor is started before the one running Linux OS.
>> Have you taken a look to this set of patches proposed by Loic:
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.or
>> g%2Flkml%2F2018%2F11%2F30%2F157&amp;data=02%7C01%7Chongxing.z
>> hu%40nxp.com%7C6773999ac6394dfe37d008d703ae3475%7C686ea1d3bc2
>> b4c6fa92cd99c5c301635%7C0%7C0%7C636981919064186660&amp;sdata=
>> OUogIs2S7gLR46%2FNcAU3OqEtB4rK3sW0gRKRRSO6xpk%3D&amp;reserved
>> =0
>> with this patch you should be able to"attach" on the fly on a preloaded
>> firmware.
> [Richard Zhu] Yes, this patch-set enable to pre-load the firmware in bootloader.
> The most difficulties when I try to use the current master/slave mode are that
>  the remote-proc controls/management mode is not applicable to the scenario,
>  especially the iMX8QXP/QM partition reset usage.
> Both A core/Linux and M core/RTOS are working independently.
> HW resources(e.x: some IP modules, DDR memory region, power domains, clocks and so on)
>  would be pre-managed and pre-assigned to A core or M core by SCFW through XRDC module
> refer to the security reasons or something else I don't know.
If i well understand the xRDC is an IP which allows hardware isolation
of some resources to the A or M core. So it is set by the secure part of
the bootloader, right?
We have an equivalence on the STM32MP1 named ETZPC.
So we also manage this use case on stm32mp1. The bootloader configures
resource isolation, and can load and start the Cortex-M firmware, before
the linux firmware. That why i pointed this patch. In case of preloaded
firmware the remote proc does not load the firmware but just parse the
resource table (address needs to be provided by the rproc_platform
driver). The rpmsg bus is probed according to the resource table entries.
This part of code is not upstreamed for time being (waiting integration
of the mentioned patch). Nevertheless You can take a look on mechanism
we implemented, on ST github (we named it early_boot):
https://github.com/STMicroelectronics/linux/blob/v4.19-stm32mp/drivers/remoteproc/stm32_rproc.c
> 
> M core/RTOS insists to run and manage its resources assigned by XRDC standalone.
> All the interactions between A core and M core are transferred on RPMSG channels.
> For example, the audio codec configuration and so on.
> So, what I do here is just setup the communication RPMSG channels between A core/Linux
> and M core/RTOS.
> 
> One more concern, I'm afraid that I may mess up the current solid reproc flow and framework if
>  I force this implementation into the current reproc drivers. 
> So, I summit this patch-set in the end. Pre-reserved vring buffer, register virtio_device, establish
> the RPMSG channels lets A core/Linux and M Core/RTOS can communicate with each other.
> That's all.
Your concern is valid, and as we have the same requirement, it would be
nice to find a common solution. That's why i propose this alternative,
which would have the advantage of reusing existing rpmsg implementation.

>>
>> 2) RPMSG recovery
>> Agree with you, this feature is important in AMP systems, as cores can have
>> their own live cycle.
>>
>> But I can not see related code, could you point out it to me?
>>
> [Richard Zhu] This feature had been validated in the local repos.
> But these codes are not contained in this patch-set, because this feature is
> relied on the SCFW(system control firm ware) used to monitor the status of
>  both side, and trigger one irq to the other side, if one side is stall.
> Unfortunately, it is not up streamed yet. So, these codes would be updated later
> If the SCFW is ready.
> 
>> Could you explain How do you recover the rpmsg channels that has been
>> already established?
>> For instance what happen if your coprocessor crash during the rpmsg
>> pingpong demo?
> [Richard Zhu] SCFW would inform the other side, if one core/OS is crashed.
> Then, the RPMSG stack would be re-initialized itself on the lived core/OS, and clarify that
> It's ready to re-establish the channels again.
> For example, M4/RTOS is crashed when pingpong demo is running.
> 1. Pingpong demo is stopped.
> 2. Lived A core/Linux would receive one irq from SCFW indicated that remote M4/RTOS is
>  reset, then all the virtio_device registered in A core/Linux side, would be un-registered,
>  and these virtio_devices would be registered again after receive the signal(e.x the mailbox rdb)
>  that M4/RTOS RPMSG stack is ready again.
> 3. Thus RPMS channels can be re-established in this situation.
> 4. Accordingly, the consumer of the rpmsg glue driver should be re-initialized too.
> For example, remove the pingpond demo module, and insmod it again.

Thanks for the clarification, i think this is no so far from the
recovery already implemented in remoteproc. Seems you remote proc driver
handles the recovery:
 -stop rproc on irq reception, restart it ( in preloaded mode) on
mailbox rdb.
On stm32MP1 we have a similar mechanism based on a Watchdog.

> 
>>
>> 3) ping-pong demo sample
>> Perhaps you could re-use the rpmsg sample available here:
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.b
>> ootlin.com%2Flinux%2Fv5.2%2Fsource%2Fsamples%2Frpmsg&amp;data=02
>> %7C01%7Chongxing.zhu%40nxp.com%7C6773999ac6394dfe37d008d703ae3
>> 475%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636981919064
>> 186660&amp;sdata=mSV3YsoyhAO%2FROfWX79X0woGQN3jx%2Fv4pL8LRUf
>> bHUM%3D&amp;reserved=0
> [Richard Zhu] Thanks a lot.
> This demo sample can be used. Sorry about that I didn't notice it before.
> 
>>
>> 4) No use of the resource table
>> Is there a reason to not use the resource table to declare the the vrings? Your
>> implementation seems to impose the same definition in both firmware while
>> resource table allow to share them.
>> Furthermore the resource table could be updated by the Linux before the
>> remote proc is started (in case of Linux booting first)
>>
> [Richard Zhu] Regarding to the auto industry requirements, the M core/RTOS is always
> started firstly, because that the CAN functions should be ready in 50ms after system is
> power up.
> BTW, resource table is a great idea in the case when Linux is booting firstly.
As explained before We also use it when cortex-M4 is booted firstly. A
constraint is that the resource table address should be known by the
remoteproc driver: either the resource table address is defined in DT,
or provided by the bootloader which loads the firmware so parses it.

> 
>> 5) slave and master mode support.
>> Seems that this drivers not fully respect the virtio protocol (for instance status
>> field). If you use a synchro mechanism (mailbox...) not sure that you really
>> need to be virtio slave on Linux.
> [Richard Zhu] Sorry about that. I used trying to keep this driver compatible with
> the current slave-master mode, but I'm failed to achieve that. ☹.
> - Partition reset feature is mandatory required.
> - M4 side insists that they should run and manage its resources standalone.
No problem, it is an RFC.
Anyway regarding you requirements and concerns, it seems that we have
the same ones. I don't know if the solution we propose can fit with your
needs, but i would be nice to have a common implementation.

Best Regards,
Arnaud

> 
> Best Regards
> Richard Zhu
>>
>> Thanks,
>> Arnaud
