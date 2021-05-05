Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E92C433ED
	for <linux-remoteproc@archiver.kernel.org>; Wed,  5 May 2021 13:45:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5FBD611EE
	for <linux-remoteproc@archiver.kernel.org>; Wed,  5 May 2021 13:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbhEENq0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 5 May 2021 09:46:26 -0400
Received: from mib.mailinblack.com ([137.74.84.110]:59246 "EHLO
        mib.mailinblack.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhEENq0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 5 May 2021 09:46:26 -0400
Received: from localhost (localhost [127.0.0.1])
        by mib.mailinblack.com (Postfix) with ESMTP id 017011AE687
        for <linux-remoteproc@vger.kernel.org>; Wed,  5 May 2021 13:45:28 +0000 (UTC)
Received: from mib.mailinblack.com (localhost [127.0.0.1])
        by mib.mailinblack.com
        with SMTP (Mib Daemon ) id KOBIJI17;
        Wed, 05 May 2021 13:45:28 +0000 (UTC)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
        by mib.mailinblack.com (Postfix) with ESMTPS id C37E01AE684;
        Wed,  5 May 2021 13:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id A9F0227E05AD;
        Wed,  5 May 2021 15:45:28 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 3dnWhuEA1uYK; Wed,  5 May 2021 15:45:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 0B7AA27E06E1;
        Wed,  5 May 2021 15:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 0B7AA27E06E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1620222328;
        bh=cGo/15GsVsllzR3obz1RQ49SC6bhNLReb6vwpqonrHM=;
        h=To:From:Message-ID:Date:MIME-Version;
        b=XL2w1CAGeGsvlNvzIKVhzXo7+FCAB2DnubKKA4ZrSfdDuVw9CV0LvLC0BudB1CrK9
         nKTiStW8gAImHV4Rra4/6lZ+Y7r6Rn1rNCbbSuyBje3wXauFZE3Fu14uiCiCb9w9HB
         4NAcmY1fsAOb4wOs+Eros/SgOUSCwwLLT+SJqs90=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id RBjSk1wuFLk2; Wed,  5 May 2021 15:45:27 +0200 (CEST)
Received: from [192.168.1.44] (alyon-652-1-90-8.w90-42.abo.wanadoo.fr [90.42.94.8])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id A871227E05AD;
        Wed,  5 May 2021 15:45:27 +0200 (CEST)
Subject: Re: race condition issue at remote proc startup
To:     Julien Hascoet <jhascoet@kalrayinc.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     linux-remoteproc@vger.kernel.org,
        Pierre-Yves Kerbrat <pkerbrat@kalrayinc.com>,
        Vincent Chardon <vchardon@kalrayinc.com>
References: <b086d39f-ee2e-39b5-c4b1-bf9fbbd6a83b@kalray.eu>
 <d6827a71-81ea-579f-dc89-68ca9055dac1@foss.st.com>
 <1000492090.19560989.1620149167907.JavaMail.zimbra@kalray.eu>
From:   Yann Sionneau <ysionneau@kalray.eu>
Message-ID: <3408b27e-0f95-3bf9-edcc-e7ab9ff5dd7e@kalray.eu>
Date:   Wed, 5 May 2021 15:45:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1000492090.19560989.1620149167907.JavaMail.zimbra@kalray.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello,

Thank you Arnaud for your very quick and interesting answer.

Thanks to your pointers Julien identified the *real* issue.

It was an issue in our OpenAMP code which was allocating DAs even in the=20
"slave" code path, instead of just doing it in the "master" code path.=20
Thus OpenAMP was actually overwritting the DAs that Linux wrote.

Issue fixed, and without any Linux patch ;)

Thanks a lot!

Regards,

Yann

On 04/05/2021 19:26, Julien Hascoet wrote:
> Hello, thanks for the quick answer,
>
>> Is the remote side waiting for the vdev status[1] update before access=
ing the vrings?
>> [1] https://elixir.bootlin.com/linux/latest/source/include/linux/remot=
eproc.h#L307
> We are using the openamp project that does it for us: https://github.co=
m/OpenAMP/open-amp/blob/master/lib/remoteproc/remoteproc.c#L925
>
> I also checked the defines and they seem aligned on both sides:
> linux: include/uapi/linux/virtio_config.h:#define VIRTIO_CONFIG_S_DRIVE=
R_OK    4
> openamp: lib/include/openamp/virtio.h:#define VIRTIO_CONFIG_STATUS_DRIV=
ER_OK 0x04
>
> Thanks !
>
> ----- Original Message -----
> From: "Arnaud POULIQUEN" <arnaud.pouliquen@foss.st.com>
> To: "Yann Sionneau" <ysionneau@kalray.eu>, linux-remoteproc@vger.kernel=
.org
> Cc: "Pierre-Yves Kerbrat" <pkerbrat@kalrayinc.com>, "Vincent Chardon" <=
vchardon@kalrayinc.com>, "jhascoet" <jhascoet@kalrayinc.com>
> Sent: Tuesday, May 4, 2021 6:43:47 PM
> Subject: Re: race condition issue at remote proc startup
>
> Hello Yann
>
> On 5/4/21 11:45 AM, Yann Sionneau wrote:
>> Hello,
>>
>> We (at Kalray) have some difficulties during initialization of a remot=
eproc
>> device, and there seem to have no clean way (at least not one we know =
of) out of
>> this problem.
>>
>> We need vring defined in the resource table to be completely initializ=
ed before
>> the remoteproc device is started. By completely initialized I mean tha=
t the
>> vring device address defined in resource table shall be changed from 0=
xff..ff to
>> a proper address. Currently the remote device is started before the
>> initialization has completed, which creates a race condition between L=
inux and
>> the remoteproc device. (We have a particular architecture in which the=
 processor
>> running Linux is the same as the embedded processor, this is why this =
problem
>> happens in our case but probably not when the processor running Linux =
is much
>> faster than the embedded processor).
> Is the remote side waiting for the vdev status[1] update before accessi=
ng the
> vrings?
>
> [1] https://elixir.bootlin.com/linux/latest/source/include/linux/remote=
proc.h#L307
>
>
>> Our best attempt up to now is to configure the virtio ring sooner i.e =
during
>> subdevice preparation instead of subdevice start.
>> i.e. in rproc_handle_vdev change code from
>>  =C2=A0=C2=A0=C2=A0 rvdev->subdev.start =3D rproc_vdev_do_start;
>> to
>>  =C2=A0=C2=A0=C2=A0 /* da field in vring must be initialized before po=
wering up
>>  =C2=A0=C2=A0=C2=A0 =C2=A0* the remoterproc, or else race condition ma=
y occur.
>>  =C2=A0=C2=A0=C2=A0 =C2=A0* Indeed the remoteproc may read it before i=
t has been initialized.
>>  =C2=A0=C2=A0=C2=A0 =C2=A0*/
>>  =C2=A0=C2=A0=C2=A0 rvdev->subdev.prepare =3D rproc_vdev_do_start;
>>
>> This works but it has undesired side effects. In particular some notif=
ications
>> are sent (the remote proc kick function is being called), but since th=
e remote
>> CPU has not been started yet we are not able to handle them, thus we s=
imply
>> ignore them if the state of the remote proc is not RUNNING.
>> At least this seems to solve our problem, but this is a particularly u=
npleasant
>> way of solving the problem, in particular it might impact the existing
>> remoteproc devices. Do you have any suggestion on some cleaner to way =
to solve
>> this problem?
>>
>> FYI, here is our arch specific remote proc implementation:
>> https://github.com/kalray/linux_coolidge/blob/coolidge/drivers/remotep=
roc/kvx_remoteproc.c
>>
>>
>> PS: there seem to be a similar problem when the remote device is being=
 stopped.
>> The vring buffer are destroyed and only after is the remote proc devic=
e stopped.
>> There is once again a race condition as the remote proc device might t=
ry to
>> access the vring after their destruction by the host. Proposed change =
is as follow:
>> In rproc_handle_vdev change code from
>>  =C2=A0=C2=A0=C2=A0 rvdev->subdev.stop =3D rproc_vdev_do_stop;
>> to
>>  =C2=A0=C2=A0=C2=A0 rvdev->subdev.unprepare =3D rproc_vdev_do_stop;
> Should also be handled with the vdev status.
>
>> Note this change has much less impact on existing remote proc and is s=
ymmetric
>> to the previous change thus it might make it sound more logical
>>
>> PS2: I guess that this issue never showed up before because most other=
 use cases
>> are using fixed addresses in the resource tables and not dynamically a=
llocated
>> ones at runtime.
> We use dynamic vring address allocation without any issue on STM323MP1 =
platform,
> with the coprocessor started before the main processor running Linux.
>
> Regards,
> Arnaud
>
>> Regards,
>>

