Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FFBEB64DA
	for <linux-remoteproc@archiver.kernel.org>; Thu, 20 Jul 2023 12:40:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbjGTMkJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 20 Jul 2023 08:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjGTMkI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 20 Jul 2023 08:40:08 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD2B2135;
        Thu, 20 Jul 2023 05:40:04 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 731A3867B0;
        Thu, 20 Jul 2023 14:39:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1689856796;
        bh=f8XyhbjfLqhWIVCe1Qt4oK/cpkZbc5yMtEPx8ztTzZE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=gvTkaGK7PaN7RI9bX6CgMhCFNU908mJeGF+RO0K6/VFdjWCS1v4fCNcZSYrdWfqSS
         QFtLbkdjxRsblxR98CJcULD0H+4H0rnQyRobnXV7Y9P02IdaYRxk7DrqL4LCSSDRq8
         IJUj9FHAnUOtKNYBN2EvjnpxAx0CrMfpEMjLGev+YCKL7GKNxUxEwkY9rkYK4Hm0QA
         Imc7NYxDTJm1qll2vczBN6DUnPS9Z1903aMcS/JKPipGnhvmWl0f8YVpLaXibi1H9m
         u3J/tHkk8MX8qwJd+xz65GKLw93Q17g+WTRDH7RHsY27dntdHdOq9EBucMoEUxhkCm
         CLmwwRkdPoyDw==
Message-ID: <253d05ad-c04a-2221-b8fb-616fcf1174f8@denx.de>
Date:   Thu, 20 Jul 2023 14:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Document
 fsl,startup-delay-ms
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230707232444.374431-1-marex@denx.de>
 <8f40484e-1721-a2bc-2344-f9e59e51a935@linaro.org>
 <d3180b8f-96d6-380b-4518-17334a90799d@denx.de>
 <c02d0271-9896-3990-33b0-c83fa54f5623@linaro.org>
 <7a1d7a67-0a0c-8527-d430-30a1cb40de48@denx.de>
 <51a1c2e9-1165-c7ff-809d-b09e09d776e2@linaro.org>
 <6e2e16be-1f83-70d2-4c5d-c2e89a7d017f@denx.de>
 <CANLsYkyWCaSwiL=nOSG1efw069GKEeK2nYkYeMVT7bx0329Bgw@mail.gmail.com>
 <38b62bf0-018a-03b9-3107-23f91fe3fa35@denx.de> <ZK2BmlSSQOLpqXFj@p14s>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <ZK2BmlSSQOLpqXFj@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 7/11/23 18:21, Mathieu Poirier wrote:
> On Tue, Jul 11, 2023 at 12:23:02AM +0200, Marek Vasut wrote:
>> On 7/11/23 00:01, Mathieu Poirier wrote:
>>> On Mon, 10 Jul 2023 at 15:53, Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 7/10/23 22:00, Krzysztof Kozlowski wrote:
>>>>> On 10/07/2023 15:46, Marek Vasut wrote:
>>>>>> On 7/10/23 14:52, Krzysztof Kozlowski wrote:
>>>>>>> On 10/07/2023 11:18, Marek Vasut wrote:
>>>>>>>> On 7/10/23 10:12, Krzysztof Kozlowski wrote:
>>>>>>>>> On 08/07/2023 01:24, Marek Vasut wrote:
>>>>>>>>>> Document fsl,startup-delay-ms property which indicates how long
>>>>>>>>>> the system software should wait until attempting to communicate
>>>>>>>>>> with the CM firmware. This gives the CM firmware a bit of time
>>>>>>>>>> to boot and get ready for communication.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>>>>>>> ---
>>>>>>>>>> Cc: Bjorn Andersson <andersson@kernel.org>
>>>>>>>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>>>>>>>> Cc: Fabio Estevam <festevam@gmail.com>
>>>>>>>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>>>>>>>>>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>>>>>>>>>> Cc: NXP Linux Team <linux-imx@nxp.com>
>>>>>>>>>> Cc: Peng Fan <peng.fan@nxp.com>
>>>>>>>>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>>>>>>>>> Cc: Rob Herring <robh+dt@kernel.org>
>>>>>>>>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>>>>>>>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>>>>>>>>> Cc: devicetree@vger.kernel.org
>>>>>>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>>>>>>> Cc: linux-remoteproc@vger.kernel.org
>>>>>>>>>> ---
>>>>>>>>>>       .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml        | 5 +++++
>>>>>>>>>>       1 file changed, 5 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>>>>>>>>> index 0c3910f152d1d..c940199ce89df 100644
>>>>>>>>>> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>>>>>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>>>>>>>>>> @@ -76,6 +76,11 @@ properties:
>>>>>>>>>>             This property is to specify the resource id of the remote processor in SoC
>>>>>>>>>>             which supports SCFW
>>>>>>>>>>
>>>>>>>>>> +  fsl,startup-delay-ms:
>>>>>>>>>> +    default: 0
>>>>>>>>>> +    description:
>>>>>>>>>> +      CM firmware start up delay.
>>>>>>>>>
>>>>>>>>> I don't see particular improvements from v2 and no responses addressing
>>>>>>>>> my comment:
>>>>>>>>> https://lore.kernel.org/all/20221102112451.128110-2-peng.fan@oss.nxp.com/
>>>>>>>>
>>>>>>>> I wasn't aware of this being submitted before, esp. since I wrote the
>>>>>>>> binding document from scratch. Which comment is not addressed, the type
>>>>>>>> ref is not present and the sentence starts with caps, so what is missing ?
>>>>>>>
>>>>>>>
>>>>>>> That the property looks like a hacky solution to some SW problem. Why
>>>>>>> this delay should be different on different boards?
>>>>>>
>>>>>> It probably depends more on the CM4 firmware that is being launched. The
>>>>>> ones I tested were fine with 50..500ms delay, but the delay was always
>>>>>> needed.
>>>>>
>>>>> If this is for some official remoteproc FW running on M4
>>>>
>>>> It is not, it is some SDK which can be downloaded from NXP website,
>>>> which can then be used to compile the firmware blob. The license is
>>>> BSD-3 however, so it is conductive to producing binaries without
>>>> matching sources ...
>>>>
>>>
>>> Why can't the SDK be upgraded to provide some kind of hand-shake
>>> mechanism, as suggested when I first reviewed this patchset?
>>
>> I'd argue because of legacy firmware that is already deployed.
>> New firmware builds can, old ones probably cannot be fixed.
>>
>> Do you have a suggestion how such a mechanism should look like?
>> As far as I can tell, the MX8M SDK stuff looks very similar to the STM32
>> Cube stuff, so maybe the mechanism is already there ?
> 
> Either with a flag in the config space of the resource table or implicit
> synchronization using the mailbox.  I suggest to have a look at struct
> mbox_client where tx_block, knows_txdone and tx_done should be useful.  I'd use
> those with a completion in rproc::ops::prepare() or rproc_ops::start().

I added the following to the CM7 BSP from NXP, which removes the need 
for the extra delay. I believe that is also the proper fix. Whether NXP 
will pick it up in some form, is up to NXP.

This whole startup-delay patch is now unnecessary for me, i.e. I stop here.

"
Run RPMSG init with IRQs globally disabled

The rpmsg_lite_remote_init() function runs in parallel with Linux side
rpmsg_probe()->virtqueue_notify()->rproc_virtio_notify() which raises an
IRQ on CM7 side. Unless IRQs are disabled during rpmsg_lite_remote_init()
time, it is possible the kick from CA53 side would be received and end up
in MU_M7_IRQHandler()->env_isr()->virtqueue_notification() for virtqueue
which is not yet fully initialized. Such IRQ would then be discarded or
mishandled, and rpmsg_lite_wait_for_link_up() would never complete. The
firmware would then fail to communicate with CA53 side.

Fix this by running the RPMSG initialization with global IRQs off, which
delays the reception of IRQ from CA53 side until after the virtqueues are
fully and properly initialized, and the IRQ can be properly handled.

diff --git 
a/boards/evkmimx8mn/multicore_examples/rpmsg_lite_str_echo_rtos/main_remote.c 
b/boards/evkmimx8mn/multicore_examples/rpmsg_lite_str_echo_rtos/main_remote.c
index 655287c..936822e 100644
--- 
a/boards/evkmimx8mn/multicore_examples/rpmsg_lite_str_echo_rtos/main_remote.c
+++ 
b/boards/evkmimx8mn/multicore_examples/rpmsg_lite_str_echo_rtos/main_remote.c
@@ -87,6 +87,7 @@ void app_task(void *param)
      /* Print the initial banner */
      PRINTF("\r\nRPMSG String Echo FreeRTOS RTOS API Demo...\r\n");

+    __disable_irq();
  #ifdef MCMGR_USED
      uint32_t startupData;

@@ -100,6 +101,7 @@ void app_task(void *param)
  #else
      my_rpmsg = rpmsg_lite_remote_init((void *)RPMSG_LITE_SHMEM_BASE, 
RPMSG_LITE_LINK_ID, RL_NO_FLAGS);
  #endif /* MCMGR_USED */
+    __enable_irq();

      rpmsg_lite_wait_for_link_up(my_rpmsg, RL_BLOCK);
"
