Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F36C433B4
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 09:53:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58A55600D4
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 09:53:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbhEDJyG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 May 2021 05:54:06 -0400
Received: from mib.mailinblack.com ([137.74.84.110]:38902 "EHLO
        mib.mailinblack.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbhEDJyF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 May 2021 05:54:05 -0400
X-Greylist: delayed 456 seconds by postgrey-1.27 at vger.kernel.org; Tue, 04 May 2021 05:54:05 EDT
Received: from localhost (localhost [127.0.0.1])
        by mib.mailinblack.com (Postfix) with ESMTP id AE6471AE04A
        for <linux-remoteproc@vger.kernel.org>; Tue,  4 May 2021 09:45:32 +0000 (UTC)
Received: from mib.mailinblack.com (localhost [127.0.0.1])
        by mib.mailinblack.com
        with SMTP (Mib Daemon ) id KO9UJ32I
        for linux-remoteproc@vger.kernel.org;
        Tue, 04 May 2021 09:45:32 +0000 (UTC)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
        by mib.mailinblack.com (Postfix) with ESMTPS id 65E1B1AE048
        for <linux-remoteproc@vger.kernel.org>; Tue,  4 May 2021 09:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 4A86027E0983
        for <linux-remoteproc@vger.kernel.org>; Tue,  4 May 2021 11:45:32 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id vMF-4WtyGgZp; Tue,  4 May 2021 11:45:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id D684427E0982;
        Tue,  4 May 2021 11:45:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu D684427E0982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1620121531;
        bh=SdP7uTm6bAmhSfwNlVOOzyjH8m2DUVz0/14sxHxGzf0=;
        h=From:To:Message-ID:Date:MIME-Version;
        b=ILEr/vecaoJhnwzMMyomhhTCftwC+4r0qWgjG8MiHepDTvBL0M1SDSDGzvLQ107rm
         /pRvae3WK6guBPRbHrbLwkuF+MyupE4M6W0TxXp0+bZm8agCbsmgrMQMkFwk766si8
         voyBoZP4RAiswB6J4q7vVwLizasBYaPYpcNqqyRw=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id ZOZL0o46RKHa; Tue,  4 May 2021 11:45:31 +0200 (CEST)
Received: from [192.168.1.44] (alyon-652-1-90-8.w90-42.abo.wanadoo.fr [90.42.94.8])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 8AB9927E052A;
        Tue,  4 May 2021 11:45:31 +0200 (CEST)
From:   Yann Sionneau <ysionneau@kalray.eu>
Subject: race condition issue at remote proc startup
Cc:     Pierre-Yves Kerbrat <pkerbrat@kalrayinc.com>,
        Vincent Chardon <vchardon@kalrayinc.com>,
        Julien Hascoet <jhascoet@kalrayinc.com>
To:     linux-remoteproc@vger.kernel.org
Message-ID: <b086d39f-ee2e-39b5-c4b1-bf9fbbd6a83b@kalray.eu>
Date:   Tue, 4 May 2021 11:45:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello,

We (at Kalray) have some difficulties during initialization of a=20
remoteproc device, and there seem to have no clean way (at least not one=20
we know of) out of this problem.

We need vring defined in the resource table to be completely initialized=20
before the remoteproc device is started. By completely initialized I=20
mean that the vring device address defined in resource table shall be=20
changed from 0xff..ff to a proper address. Currently the remote device=20
is started before the initialization has completed, which creates a race=20
condition between Linux and the remoteproc device. (We have a particular=20
architecture in which the processor running Linux is the same as the=20
embedded processor, this is why this problem happens in our case but=20
probably not when the processor running Linux is much faster than the=20
embedded processor).

Our best attempt up to now is to configure the virtio ring sooner i.e=20
during subdevice preparation instead of subdevice start.
i.e. in rproc_handle_vdev change code from
 =C2=A0=C2=A0=C2=A0 rvdev->subdev.start =3D rproc_vdev_do_start;
to
 =C2=A0=C2=A0=C2=A0 /* da field in vring must be initialized before power=
ing up
 =C2=A0=C2=A0=C2=A0 =C2=A0* the remoterproc, or else race condition may o=
ccur.
 =C2=A0=C2=A0=C2=A0 =C2=A0* Indeed the remoteproc may read it before it h=
as been initialized.
 =C2=A0=C2=A0=C2=A0 =C2=A0*/
 =C2=A0=C2=A0=C2=A0 rvdev->subdev.prepare =3D rproc_vdev_do_start;

This works but it has undesired side effects. In particular some=20
notifications are sent (the remote proc kick function is being called),=20
but since the remote CPU has not been started yet we are not able to=20
handle them, thus we simply ignore them if the state of the remote proc=20
is not RUNNING.
At least this seems to solve our problem, but this is a particularly=20
unpleasant way of solving the problem, in particular it might impact the=20
existing remoteproc devices. Do you have any suggestion on some cleaner=20
to way to solve this problem?

FYI, here is our arch specific remote proc implementation:=20
https://github.com/kalray/linux_coolidge/blob/coolidge/drivers/remoteproc=
/kvx_remoteproc.c

PS: there seem to be a similar problem when the remote device is being=20
stopped. The vring buffer are destroyed and only after is the remote=20
proc device stopped. There is once again a race condition as the remote=20
proc device might try to access the vring after their destruction by the=20
host. Proposed change is as follow:
In rproc_handle_vdev change code from
 =C2=A0=C2=A0=C2=A0 rvdev->subdev.stop =3D rproc_vdev_do_stop;
to
 =C2=A0=C2=A0=C2=A0 rvdev->subdev.unprepare =3D rproc_vdev_do_stop;

Note this change has much less impact on existing remote proc and is=20
symmetric to the previous change thus it might make it sound more logical

PS2: I guess that this issue never showed up before because most other=20
use cases are using fixed addresses in the resource tables and not=20
dynamically allocated ones at runtime.

Regards,

--=20
Yann

