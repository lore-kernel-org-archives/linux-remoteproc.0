Return-Path: <o.rempel@pengutronix.de>
Subject: Re: [EXT] Re: [RFC 2/2] rpmsg: imx: add the initial imx rpmsg support
References: <1561968784-1124-1-git-send-email-hongxing.zhu@nxp.com>
 <1561968784-1124-3-git-send-email-hongxing.zhu@nxp.com>
 <3e0a061c-4f5e-ac32-031d-909a48644265@pengutronix.de>
 <AM0PR0402MB35706FFBFD76FF81BCF5E6018CF60@AM0PR0402MB3570.eurprd04.prod.outlook.com>
From: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <e4629709-fbe7-6af9-3cee-309b2ec1892f@pengutronix.de>
Date: Mon, 8 Jul 2019 13:02:33 +0200
MIME-Version: 1.0
In-Reply-To: <AM0PR0402MB35706FFBFD76FF81BCF5E6018CF60@AM0PR0402MB3570.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Richard Zhu <hongxing.zhu@nxp.com>, "ohad@wizery.com" <ohad@wizery.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Cc: "loic.pallardy@st.com" <loic.pallardy@st.com>, "arnaud.pouliquen@st.com" <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "elder@linaro.org" <elder@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Richard,

On 08.07.19 12:17, Richard Zhu wrote:
> Hi Oleksij:
> Thanks for your comments.
> 
> 
>> -----Original Message-----
>> From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
>> Sent: 2019年7月4日 17:36
>> To: Richard Zhu <hongxing.zhu@nxp.com>; ohad@wizery.com;
>> bjorn.andersson@linaro.org; linux-remoteproc@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org; Fabien DESSENNE
>> <fabien.dessenne@st.com>; loic.pallardy@st.com; arnaud.pouliquen@st.com;
>> s-anna@ti.com; elder@linaro.org
>> Subject: [EXT] Re: [RFC 2/2] rpmsg: imx: add the initial imx rpmsg support
>>
>> Caution: EXT Email
>>
>> Hi Richard,
>>
>> On 01.07.19 10:34, Richard Zhu wrote:
>>> Based on "virtio_rpmsg_bus" driver, This patch-set is used to set up
>>> the communication mechanism between A core and M core on i.MX AMP
>> SOCs.
>>>
>>> Add the initial imx rpmsg support glue driver and one pingpong demo,
>>> demonstrated the data transactions between A core and remote M core.
>>> Distributed framework is used in IMX RPMSG implementation, refer to
>>> the following requirements:
>>>     - The CAN functions contained in M core and RTOS should be ready and
>>>       complete functional in 50ms after AMP system is turned on.
>>>     - Partition reset. System wouldn't be stalled by the exceptions (e.x
>>>       the reset triggered by the system hang) occurred at the other side.
>>>       And the RPMSG mechanism should be recovered automactilly after
>> the
>>>       partition reset is completed.
>>> In this scenario, the M core and RTOS would be kicked off by
>>> bootloader firstly, then A core and Linux would be loaded later. Both
>>> M core/RTOS and A core/Linux are running independly.
>>>
>>> One physical memory region used to store the vring is mandatory
>>> required to pre-reserved and well-knowned by both A core and M core
>>
>> I don't see any thing imx specific in this patch. We already have remoteproc
>> which would parse firmware header and create needed devices. This driver is
>> only needed for the case where firmware was stared by the bootloader.
>>
> [Richard Zhu] Bootloader starts the firmware is mandatory required in these scenario
> refer to the reasons listed in the commit.
> Thus, the distributed framework has to be used, and both A core/Linux and remote core/RTOS
> works independently.
> 
>> I personally would prefer to have generic driver or extend the remoteproc
>> framework. So we can notify kernel about work already done by bootloader.
>>
> [Richard Zhu] Thanks for your suggestions.
> Regarding to my understand, it seems that master/slave mode is used in the remoteproc currently.
> A core/Linux acts as master, to controls/manipulates remote core/RTOS.
> It isn't applicable for the scenario described by this patch-set.
> 
>> In general, some more issues should be solved:
>> - Handle or not touch idle clocks for different node used by M core and not
>> main system.
>> - pin control
>> - regulators
>>
>> ST devs already tried to solve this issues by creating "remoteproc: add system
>> resource manager device" patch. I don't know what is current state of it (/me
>> adding ST devs to CC).
>>
> [Richard Zhu] Yes, it is. Many contributions have been made by Fabien.
> IMHO, there are some different behaviors on iMX8QXP/QM platforms, the
>   resources (e.x IP modules) had been assigned and managed by the XRDC.
> In the other words, the HW resources would be assigned and managed would
>   be transparent to SW.
> 
> Thus, both A core/Linux and M core/RTOS can work real independently.
> System wouldn't be stalled by the exceptions (e.x the reset triggered by the
> system hang) occurred at the other side. And the RPMSG mechanism should
>   be recovered automatically after the partition reset is completed.

It is exactly the way I did understood it in the firs mail. Any way, i'm ok
with this driver. Just rename imx to some thing generic. This driver can and will be 
reused on other platforms as well.

Kind regards,
Oleksij Rempel

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
