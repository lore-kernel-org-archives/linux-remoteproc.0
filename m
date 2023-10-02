Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4CEE784BC
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Oct 2023 15:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237923AbjJBPAx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Oct 2023 11:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237920AbjJBPAx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Oct 2023 11:00:53 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B48B3
        for <linux-remoteproc@vger.kernel.org>; Mon,  2 Oct 2023 08:00:50 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5a2478862dbso31593477b3.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Oct 2023 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696258849; x=1696863649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLX6qR2+Q5mi1LwE6bpojMSAkYHcKcEWGrPAbcg8XT4=;
        b=pLxhHWM1Mw2lcdszzqZdQ3JwH6T9bvzKnuzedbAMx+ROhIY7MHtsv+ZeR0QPuOOEri
         /IrBQ/ButSD208SLlpYUsHBnS/9sW3v2FLS73Mo8h/5B5WzwnMgukEJ8rs5Iz9QKJile
         lcjz0ov6QfhJKnqAxqm6xeLzpUZNgLQAbnnGUlOB+kk/dm/HXBF+GpQQseaPSOuYbjOy
         CHwX23OInWiULF68qO7nRdNz6XOjWWXauZSefL5kVn9mKvoXNtbUptc9Pn4kd4x+zU+e
         +aFKFGZiIqEv3baFoAP8APBVdtWRo5L/4ZR7asJd9lmn0fgmoa6ceRnupKkR0cLNG7hz
         P3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696258849; x=1696863649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLX6qR2+Q5mi1LwE6bpojMSAkYHcKcEWGrPAbcg8XT4=;
        b=jzx4dxzalwIOioy3PlBEdju3nzLxAF4zy8PgXBModEYZ5xlMp6p+A4gqUfGSIdbJJp
         /Jf632JqugvT9fs2UJIFQdWJq1uY4E0SkZvoIMWuYzHO/Mv69mf9uJaz2bqqKRzpGPmI
         9MrWKAjDJ+MFyzMzQS8tDESmuu8lsYpCg/L5B8P8/WEeZFoAs+MRlBQSkipzfuvU2LtS
         OxXaAFMMdqjaW51MPHpbQY9lvSDGqIk+KmYPvBF4qEHJymkuMtGOiNfIlcx2bI1Fw8mV
         3c5H0AwlhPJK4oHXT9Z6Vx4A9wkLo66BlBgkQrxFCt/isJQbM9xz75NRfzRb9FU1ttBW
         zLlQ==
X-Gm-Message-State: AOJu0YwBIgvcTobIHIE9jjxkc9jW9DPPE6EVsIW/02tGoOBMiWbKJsMk
        bdL9pEh2sKwTrWRKK2w9MS8vyohHNsJQh6MfQfXknw==
X-Google-Smtp-Source: AGHT+IE1ztG3I7ttM2ccUwkElFR3unjVRXSozChG1K4p361UjC7UjH3xd3BAVeAmZTjZfdntvVtrbEYW1beMDExyK+0=
X-Received: by 2002:a81:6d8c:0:b0:584:4b5f:bac3 with SMTP id
 i134-20020a816d8c000000b005844b5fbac3mr11641374ywc.15.1696258849265; Mon, 02
 Oct 2023 08:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230905-caleb-qmi_cooling-v1-0-5aa39d4164a7@linaro.org>
 <20231001155701.GA53767@thinkpad> <cefe711b-d274-4d83-9dda-01f33b342387@linaro.org>
 <20231002145239.GA12041@thinkpad>
In-Reply-To: <20231002145239.GA12041@thinkpad>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 2 Oct 2023 18:00:37 +0300
Message-ID: <CAA8EJppn-f6R3ObGvagqkg1_KtXGgtNAgRn-LQiN3ORSHQY3-Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] thermal: Introduce Qualcomm Thermal Mitigation Device support
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bhupesh Sharma <bhupesh.linux@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 2 Oct 2023 at 17:52, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Sun, Oct 01, 2023 at 06:26:14PM +0100, Caleb Connolly wrote:
> >
> >
> > On 01/10/2023 16:57, Manivannan Sadhasivam wrote:
> > > On Fri, Sep 29, 2023 at 05:16:16PM +0100, Caleb Connolly wrote:
> > > > The Thermal Mitigation Device (TMD) Service is a QMI service that r=
uns
> > > > on remote subsystems (the modem and DSPs) on Qualcomm SoCs.
> > > > It exposes various mitigations including passive thermal controls a=
nd
> > > > rail voltage restrictions.
> > > >
> > > > This series introduces support for exposing TMDs as cooling devices
> > > > in the kernel through the thermal framework, using the QMI interfac=
e.
> > > >
> > > > Each TMD client is described as a child of the remoteproc node in
> > > > devicetree. With subnodes for each control.
> > > >
> > >
> > > Daniel expressed concerns in the past aganist representing TMD driver=
 as a
> > > cooling device since it is not tied to thermal zones and the governor=
s cannot
> > > use it. Instead he suggested to represent it as a powercap device wit=
h thermal
> > > constraints.
> >
> > Hi Mani,
> >
> > Forgive me as I'm not yet super familiar with the thermal subsystem.
> >
> > As I understand it, the DT layout here enables each control to be refer=
enced
> > under the thermal zones, at least this is the approach taken in CAF 4.9=
.
> >
> > Maybe I don't quite understand what you mean, are you saying that using
> > thermal zones is the wrong approach?
>
> Thermal framework expects each thermal zone represented in DT to have atl=
east
> one corresponding thermal sensor defined using "thermal-sensors" property=
. But
> with TMD, there is no thermal sensor AFAIK.

As far as I understand, no. It is perfectly fine to have 'cooling'
devices, which react to external thermal monitoring events. I might be
mistaken, but I think that is the case here, isn't it?

>
> > >
> > > So please look into that approach.
> >
> > Any recommended reading? Or drivers I can use as a reference?
> >
>
> drivers/powercap/arm_scmi_powercap.c seems to be a good reference.
>
> - Mani
>
> > Thanks
> > >
> > > - Mani
> > >
> > > > This series is based on previous work by Bhupesh Sharma which can b=
e
> > > > found at [1]. I'm sending this as a fresh series as it has been a
> > > > year since the original version and I have rewritten most of the dr=
iver.
> > > >
> > > > [1]: https://lore.kernel.org/linux-arm-msm/20220912085049.3517140-1=
-bhupesh.sharma@linaro.org/
> > > >
> > > > ---
> > > > Caleb Connolly (4):
> > > >        remoteproc: qcom: probe all child devices
> > > >        dt-bindings: thermal: Add qcom,qmi-cooling yaml bindings
> > > >        thermal: qcom: add qmi-cooling driver
> > > >        MAINTAINERS: Add entry for Qualcomm Cooling Driver
> > > >
> > > >   .../bindings/remoteproc/qcom,msm8996-mss-pil.yaml  |  13 +
> > > >   .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +
> > > >   .../bindings/thermal/qcom,qmi-cooling.yaml         | 168 +++++++
> > > >   MAINTAINERS                                        |   8 +
> > > >   drivers/remoteproc/qcom_q6v5.c                     |   4 +
> > > >   drivers/remoteproc/qcom_q6v5_mss.c                 |   8 -
> > > >   drivers/thermal/qcom/Kconfig                       |  13 +
> > > >   drivers/thermal/qcom/Makefile                      |   1 +
> > > >   drivers/thermal/qcom/qmi-cooling.c                 | 520 ++++++++=
+++++++++++++
> > > >   drivers/thermal/qcom/qmi-cooling.h                 | 428 ++++++++=
+++++++++
> > > >   10 files changed, 1161 insertions(+), 8 deletions(-)
> > > > ---
> > > > base-commit: 9067f80db58bbce81d5f0703aa2fd261e88bc812
> > > >
> > > > // Caleb (they/them)
> > > >
> > >
> >
> > --
> > // Caleb (they/them)
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D



--=20
With best wishes
Dmitry
