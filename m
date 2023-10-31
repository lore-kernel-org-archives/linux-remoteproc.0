Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABDBC4167B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 31 Oct 2023 10:32:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343923AbjJaKcm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 31 Oct 2023 06:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343933AbjJaKcl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 31 Oct 2023 06:32:41 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4EDDF
        for <linux-remoteproc@vger.kernel.org>; Tue, 31 Oct 2023 03:32:38 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-53df747cfe5so9339735a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 31 Oct 2023 03:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1698748357; x=1699353157; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/z7I4I6Ue6X/8QZFKW37T9J79TpuairJQ9mOGuz80rA=;
        b=NIlSf74lteV0usPR9QZ4TVvTMhsK4e3eKEhGUCnOiUWoD45ZiA1kSU5WUXufHIwTZ3
         r14sPsF1FX+48ch08GaKW6oABI3t9sF4lJu6sFlo8xIuRdjLCmOaazUnwNG8PlmehFWa
         7gDrsyaObHc+o/tEjhGKFC3W/1CxB8Cf+CQK666+m8nJKhvk3/mR0F9OM794vuQ86JW0
         08Qd2cKg73kznOZ3c9//96c7luON5t5fpJqunr8aDT+DMlfXSVbYAeGII22r2ppRRVMQ
         dZAEouzloPutw0vq0fuBw9P6qMlutYIF3nHiu3mq703UqcBk7NFYDPb2iXuByS99Cm+K
         pXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698748357; x=1699353157;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/z7I4I6Ue6X/8QZFKW37T9J79TpuairJQ9mOGuz80rA=;
        b=KFjT46sy7Xyz+mkK3rFoLb9l8BySYKtPoSJh3KATzYOdWtockiieFORm5Dygi/cz3A
         K3F07C279weaqjbwyfLOss2UWCakkVUWC80sAiCNkELbJfORTz7oK9OeRRWD6hlyaxO3
         O50JQtzerHJ3F0HyD7sYMOD6gPKUa5D5udUqoeS5LyUmQwQp+hIpj9VTq9SJMfSQSW++
         pSafYcaadtTrTat688+bnb2Xd2Sbm8KlN8NrGzzpLGw8XVb95Vhnj6Ir4EWhfXIEHVy0
         urziUuWtf774A67lBfOeghs+4vazBSSGIOoDGbIflFAFRzmh70z0Md0F0uJl67c3EpY6
         7fqg==
X-Gm-Message-State: AOJu0YzreUAhLH7aFhGQRk5MFTfogRGdJ0R+/11GJDzFd3baoQ5I0EEe
        ux3Wu5ci73hRonyreJrugWrGXA==
X-Google-Smtp-Source: AGHT+IFeopkf70ECoETCWfV7h6hf9HbaHb+hXuv+kILq+9OLbn3r709dSon6w8VF3ZJQiLE+tEQBqw==
X-Received: by 2002:a50:9ee7:0:b0:543:7b0d:aea9 with SMTP id a94-20020a509ee7000000b005437b0daea9mr607881edf.15.1698748356670;
        Tue, 31 Oct 2023 03:32:36 -0700 (PDT)
Received: from localhost (mobiledyn-62-240-134-77.mrsn.at. [62.240.134.77])
        by smtp.gmail.com with ESMTPSA id w6-20020aa7da46000000b005402c456892sm892376eds.33.2023.10.31.03.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 03:32:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 31 Oct 2023 11:32:32 +0100
Message-Id: <CWMK17PODRQH.3PI87XYO1JVK@fairphone.com>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        "Rob Herring" <robh@kernel.org>,
        =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 8/9] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 various remoteprocs
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Mathieu Poirier" <mathieu.poirier@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Manivannan Sadhasivam" <mani@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>
X-Mailer: aerc 0.15.2
References: <20231027-sc7280-remoteprocs-v1-0-05ce95d9315a@fairphone.com>
 <20231027-sc7280-remoteprocs-v1-8-05ce95d9315a@fairphone.com>
 <4dfe793e-4d70-427e-bce5-8191c6a42cf9@linaro.org>
In-Reply-To: <4dfe793e-4d70-427e-bce5-8191c6a42cf9@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon Oct 30, 2023 at 8:26 PM CET, Konrad Dybcio wrote:
> On 27.10.2023 16:20, Luca Weiss wrote:
> > Enable the ADSP, CDSP, MPSS and WPSS that are found on the SoC.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 20 ++++++++++++++=
++++++
> >  1 file changed, 20 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/=
arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > index cc092735ce17..d65eef30091b 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > @@ -490,6 +490,26 @@ &qupv3_id_1 {
> >  	status =3D "okay";
> >  };
> > =20
> > +&remoteproc_adsp {
> > +	firmware-name =3D "qcom/qcm6490/fairphone5/adsp.mdt";
> > +	status =3D "okay";
> > +};
> > +
> > +&remoteproc_cdsp {
> > +	firmware-name =3D "qcom/qcm6490/fairphone5/cdsp.mdt";
> > +	status =3D "okay";
> > +};
> > +
> > +&remoteproc_mpss {
> > +	firmware-name =3D "qcom/qcm6490/fairphone5/modem.mdt";
> > +	status =3D "okay";
> > +};
> > +
> > +&remoteproc_wpss {
> > +	firmware-name =3D "qcom/qcm6490/fairphone5/wpss.mdt";
> mbn?

Downstream ships mdt but if preferred I can change to .mbn and use
pil-squasher. Not sure what's the correct thing nowadays :)

Regards
Luca

>
> Konrad

