Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C673AC433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 29 Oct 2021 10:46:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A346061166
	for <linux-remoteproc@archiver.kernel.org>; Fri, 29 Oct 2021 10:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbhJ2KtA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 29 Oct 2021 06:49:00 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:54365 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231749AbhJ2Ks7 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 29 Oct 2021 06:48:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635504391; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=rFU43CZFSHt8yp8kFqVcfqXL2hfgxXG01x0my4/WQE8=; b=mTvPr9uIhPBRO3vHQNXxlLb9WpZONqo8f9YS50c4vyUQBiq8qtmjgNozhm9gEwR0pihAP1w1
 KP8NEqORaZCs0scRRKzNBjwFTbzuHhuEVID1eW6Oad2kaBu0MCnPhk1lW6nqmXJGTmV87HBb
 NVAKrLXCIDCGGLXy0BV6sqr+xA0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 617bd0f5f6a3eeacf9a3114d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 Oct 2021 10:46:13
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BCA14C4338F; Fri, 29 Oct 2021 10:46:12 +0000 (UTC)
Received: from PILLAIR1 (unknown [49.205.244.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 493C6C4338F;
        Fri, 29 Oct 2021 10:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 493C6C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Stephen Boyd'" <swboyd@chromium.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <ohad@wizery.com>, <p.zabel@pengutronix.de>, <robh+dt@kernel.org>
Cc:     <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sibis@codeaurora.org>,
        <mpubbise@codeaurora.org>, <kuabhs@chromium.org>
References: <1635408817-14426-1-git-send-email-pillair@codeaurora.org> <1635408817-14426-3-git-send-email-pillair@codeaurora.org> <CAE-0n50z=h-avn+K-weZnZFVN7nsR=fLAtge7jFZ0JLx2JvP2w@mail.gmail.com>
In-Reply-To: <CAE-0n50z=h-avn+K-weZnZFVN7nsR=fLAtge7jFZ0JLx2JvP2w@mail.gmail.com>
Subject: RE: [PATCH v7 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
Date:   Fri, 29 Oct 2021 16:16:03 +0530
Message-ID: <000201d7ccb2$300dba50$90292ef0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJgH59fIqV+fNPJ+TYlgPfT9cxLcAIxEhLJAenqyY+quEywIA==
Content-Language: en-us
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



> -----Original Message-----
> From: Stephen Boyd <swboyd@chromium.org>
> Sent: Friday, October 29, 2021 3:38 AM
> To: Rakesh Pillai <pillair@codeaurora.org>; agross@kernel.org;
> bjorn.andersson@linaro.org; mathieu.poirier@linaro.org; =
ohad@wizery.com;
> p.zabel@pengutronix.de; robh+dt@kernel.org
> Cc: linux-arm-msm@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> sibis@codeaurora.org; mpubbise@codeaurora.org; kuabhs@chromium.org
> Subject: Re: [PATCH v7 2/3] dt-bindings: remoteproc: qcom: Add SC7280
> WPSS support
>
> > +
> > +        glink-edge {
> > +            interrupts-extended =3D <&ipcc IPCC_CLIENT_WPSS
> > +                                         =
IPCC_MPROC_SIGNAL_GLINK_QMP
> > +                                         IRQ_TYPE_EDGE_RISING>;
> > +            mboxes =3D <&ipcc IPCC_CLIENT_WPSS
> > +                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
> > +
> > +            label =3D "wpss";
> > +            qcom,remote-pid =3D <13>;
>=20
> There are a few properties here that don't seem to be required. Is =
that
> intentional?

Hi Stephen,
All the properties in the example are listed as required (except for =
status, which will be removed in the subsequent patchset).
Do you mean the glink-edge node properties ?

Thanks,
Rakesh Pillai.

