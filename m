Return-Path: <SRS0=OhS6=DM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A871FC4363A
	for <linux-remoteproc@archiver.kernel.org>; Mon,  5 Oct 2020 15:49:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7061920639
	for <linux-remoteproc@archiver.kernel.org>; Mon,  5 Oct 2020 15:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbgJEPtB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 5 Oct 2020 11:49:01 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51234 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgJEPtA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 5 Oct 2020 11:49:00 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id E5AE928F6CC
Subject: Re: [PATCH 3/3] dt-bindings: mfd: google,cros-ec: add missing
 properties
To:     Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
Cc:     Collabora Kernel ML <kernel@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Simon Glass <sjg@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, Pi-Hsun Shih <pihsun@chromium.org>,
        ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@google.com>
References: <20201005071403.17450-1-ricardo.canuelo@collabora.com>
 <20201005071403.17450-4-ricardo.canuelo@collabora.com>
 <CAL_JsqJ5E6LSis1LzgEGPN6aEktkFamRn19v0s-x_OZ+8yMTiA@mail.gmail.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <7080db15-35d5-8a38-4663-4e30126085c5@collabora.com>
Date:   Mon, 5 Oct 2020 17:48:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJ5E6LSis1LzgEGPN6aEktkFamRn19v0s-x_OZ+8yMTiA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

On 5/10/20 17:37, Rob Herring wrote:
> On Mon, Oct 5, 2020 at 2:14 AM Ricardo Cañuelo
> <ricardo.canuelo@collabora.com> wrote:
>>
>> Add missing properties that are currently used in the examples of
>> subnode bindings and in many DTs.
>> This fixes all current dt_binding_check and dtbs_check warnings related
>> to this binding.
>>
>> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
>> ---
>>  .../bindings/mfd/google,cros-ec.yaml          | 40 +++++++++++++++++++
>>  1 file changed, 40 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
>> index f49c0d5d31ad..c2dc05cdef9f 100644
>> --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
>> @@ -59,18 +59,58 @@ properties:
>>        whether this nvram is present or not.
>>      type: boolean
>>
>> +  mtk,rpmsg-name:
> 
> This should have been mediatek,rpmsg-name, but I guess we're stuck with it.
> 

cc'ing the remote-proc maintainers and some ChromeOS people to be aware.

Seems that the patches that introduce the use of this propietry in the bindings
are still in linux-next, so maybe we're on time to fix it?

In such case, Ricardo can you take care of it and send patches fixing it?

Thanks,
 Enric

>> +    description:
>> +      Must be defined if the cros-ec is a rpmsg device for a Mediatek
>> +      ARM Cortex M4 Co-processor. Contains the name pf the rpmsg
>> +      device. Used to match the subnode to the rpmsg device announced by
>> +      the SCP.
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +
>>    spi-max-frequency:
>>      description: Maximum SPI frequency of the device in Hz.
>>
>>    reg:
>>      maxItems: 1
>>
>> +  '#address-cells':
>> +    enum: [1, 2]
>> +
>> +  '#size-cells':
>> +    enum: [0, 1]
> 
> This doesn't really make sense. Either there's a size or there isn't.
> 
> [...]
> 
>> +  "^regulator@[a-f0-9]+$":
>> +  "^ec-codec@[a-f0-9]+$":
> 
> What does the number space represent and is it the same for each of
> these? If not, then this is kind of broken. There's only 1 number
> space at a given level.
> 
> Rob
> 
