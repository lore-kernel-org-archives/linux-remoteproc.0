Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BFF69946
	for <linux-remoteproc@vger.kernel.org>; Thu, 25 Apr 2024 07:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714029031; cv=none; b=Zwgq/6g0Re2uYJu5mEK3WkNP4BhlWYIY0yH0ajf3LTcLp7qulamDlFGWKVkK1cXfR97wvaOxxIxpxgYR39ldJ6JBc/JomcCSlFMXogvPwOSDz3lpGAYJIFNkKy/TheIqH29ZpvH4U0T8hp10/YuyhDneXuOu7BLBZjSTswAr1YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714029031; c=relaxed/simple;
	bh=UosUzcAmwAOmYz9QmcT8Kb2jGebrbGq4Ag1KzqJ9J30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYg3c+cq0s/bkSnuEYhF0Uc+eulOfMjRq/Y+fT36Tep0B7KozANYyRZW+7bBVc4xMA6lyyqORIZSpAjwVHJ0v6i7OzUApoQ1xKvKgJC2Y7+D02jCTQIbC/ny9wODNDXL5taOqEZ+rTOf6KIq9UOgkI4/oiRt4wTpQipPQEF+dsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HaAVBR2t; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HaAVBR2t"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-de467733156so764257276.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 25 Apr 2024 00:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714029029; x=1714633829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oX94Z3yE7ZvhQXajp2mIOeyVn6muLJyVNKFNFAUgCM=;
        b=HaAVBR2t2uEvmWpUJWSamKjcGulEiNRVBKtoheA+XQwiSBclHTY5EzR0wxmp7/KmrN
         lB1Qjm/2c4xXJqDGvAzBOrk5OQglgB1ck4QOSoc+6A7JMW/KMdz75ai3D4TE/n/NMYzl
         fMLOD0gPQlRWGsRYqP7DAXyHvVcumaTFVkP31aEe3KiEKrLb7mJnmga97yJGXCMGZixe
         5EOP4sqJHLZuZh73vs+DeRwCnzU8tybYgUqMYRTXJMVnx3cLOs1zUS3NW4DzOfSf/Bpe
         A9WZmZ0B7+e2uSgoy9lN3bZj8MyG599IBCAMflP+lAeb+elo0ZouZjgf/3Pb+U2fYWYa
         V7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714029029; x=1714633829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oX94Z3yE7ZvhQXajp2mIOeyVn6muLJyVNKFNFAUgCM=;
        b=DELwZB8cRgpBrgUlNkxgFiE8FgUueAb/OEbagcgYJnF2lsPojhvAkCArWCIS++NZTS
         6V7fn2bnoZIXZZyBpWLEpUypwbhxwGmlFDjbSh6l6Aqph/3LmJ49zNKGVmjJiaNyPupu
         XPAekJaBRg3lTDLy1vlJNdMkTOLQu1XH7FX8t3iZzawloFl51jOYKIpHVvaETMnXn+t9
         1KPa+60wUc4lFHJQue/Bq+/QLBLN9H01URDKRBIZ5GBUVxDoZY0EisEiB5Re5D+52Q/v
         Ql+Wn58l9x2k6MoOhZSS7qwEbU0u9INOCA/pFI/3TG5Xkqi6Xl0hKrDP8dS7VHMLDBS/
         9uzg==
X-Forwarded-Encrypted: i=1; AJvYcCV7EyLxHVkcduJibZ3mBqtuqfOVnejYBdRbD7FZ4YdBK10zUQaKBC0TMjj6FjK6++FbYs+uRqynAbzWM+CZVrCwFfhxTjw9OVheSMH8jAncWQ==
X-Gm-Message-State: AOJu0YyQS5p4fNfD5W2pWb2VHW1bV1bMpgpIJZNwGLbsAWiW1Vnj8mHR
	N0dTxVlWMa4vNZMSjqrZ2lC2SOhfUn+9f/9Wnu6+w9Q49WokL2LAJe61Uuae6se/8d7Y24JnHAk
	8yyJz7tKdF1qahTabgKo9QswdSP6OlT34Cds6ag==
X-Google-Smtp-Source: AGHT+IEuFXDLhT7w9hM4vccu8hN9DCiG61JhtScCmniCBEvYXxmf13IcAi4DlzLZfzd85CUtnDoN77G3bW+dO7pnOj4=
X-Received: by 2002:a25:ef0e:0:b0:dcc:f5d4:8b43 with SMTP id
 g14-20020a25ef0e000000b00dccf5d48b43mr5704734ybd.9.1714029029048; Thu, 25 Apr
 2024 00:10:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org> <CAKXuJqi4GS5T9JXuo39Zyma-2jSc1-rW9mg=nDQRSyB=ni9-1Q@mail.gmail.com>
In-Reply-To: <CAKXuJqi4GS5T9JXuo39Zyma-2jSc1-rW9mg=nDQRSyB=ni9-1Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Apr 2024 10:10:18 +0300
Message-ID: <CAA8EJppE4Xaf0ByoMZN3BzjHrBhL-mv3P=BvDht88eHk51AVGA@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] soc: qcom: add in-kernel pd-mapper implementation
To: Steev Klimaszewski <steev@kali.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	Xilin Wu <wuxilin123@gmail.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Apr 2024 at 10:08, Steev Klimaszewski <steev@kali.org> wrote:
>
> Hi Dmitry,
>
> On Wed, Apr 24, 2024 at 4:28=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Protection domain mapper is a QMI service providing mapping between
> > 'protection domains' and services supported / allowed in these domains.
> > For example such mapping is required for loading of the WiFi firmware o=
r
> > for properly starting up the UCSI / altmode / battery manager support.
> >
> > The existing userspace implementation has several issue. It doesn't pla=
y
> > well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if th=
e
> > firmware location is changed (or if the firmware was not available at
> > the time pd-mapper was started but the corresponding directory is
> > mounted later), etc.
> >
> > However this configuration is largely static and common between
> > different platforms. Provide in-kernel service implementing static
> > per-platform data.
> >
> > Unlike previous revisions of the patchset, this iteration uses static
> > configuration per platform, rather than building it dynamically from th=
e
> > list of DSPs being started.
> >
> > To: Bjorn Andersson <andersson@kernel.org>
> > To: Konrad Dybcio <konrad.dybcio@linaro.org>
> > To: Sibi Sankar <quic_sibis@quicinc.com>
> > To: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-remoteproc@vger.kernel.org
> > Cc: Johan Hovold <johan+linaro@kernel.org>
> > Cc: Xilin Wu <wuxilin123@gmail.com>
> > Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> > --
> >
> > Changes in v7:
> > - Fixed modular build (Steev)
> > - Link to v6: https://lore.kernel.org/r/20240422-qcom-pd-mapper-v6-0-f9=
6957d01207@linaro.org
> >
> > Changes in v6:
> > - Reworked mutex to fix lockdep issue on deregistration
> > - Fixed dependencies between PD-mapper and remoteproc to fix modular
> >   builds (Krzysztof)
> > - Added EXPORT_SYMBOL_GPL to fix modular builds (Krzysztof)
> > - Fixed kerneldocs (Krzysztof)
> > - Removed extra pr_debug messages (Krzysztof)
> > - Fixed wcss build (Krzysztof)
> > - Added platforms which do not require protection domain mapping to
> >   silence the notice on those platforms
> > - Link to v5: https://lore.kernel.org/r/20240419-qcom-pd-mapper-v5-0-e3=
5b6f847e99@linaro.org
> >
> > Changes in v5:
> > - pdr: drop lock in pdr_register_listener, list_lock is already held (C=
hris Lew)
> > - pd_mapper: reworked to provide static configuration per platform
> >   (Bjorn)
> > - Link to v4: https://lore.kernel.org/r/20240311-qcom-pd-mapper-v4-0-24=
679cca5c24@linaro.org
> >
> > Changes in v4:
> > - Fixed missing chunk, reenabled kfree in qmi_del_server (Konrad)
> > - Added configuration for sm6350 (Thanks to Luca)
> > - Removed RFC tag (Konrad)
> > - Link to v3: https://lore.kernel.org/r/20240304-qcom-pd-mapper-v3-0-68=
58fa1ac1c8@linaro.org
> >
> > Changes in RFC v3:
> > - Send start / stop notifications when PD-mapper domain list is changed
> > - Reworked the way PD-mapper treats protection domains, register all of
> >   them in a single batch
> > - Added SC7180 domains configuration based on TCL Book 14 GO
> > - Link to v2: https://lore.kernel.org/r/20240301-qcom-pd-mapper-v2-0-5d=
12a081d9d1@linaro.org
> >
> > Changes in RFC v2:
> > - Swapped num_domains / domains (Konrad)
> > - Fixed an issue with battery not working on sc8280xp
> > - Added missing configuration for QCS404
> >
> > ---
> > Dmitry Baryshkov (6):
> >       soc: qcom: pdr: protect locator_addr with the main mutex
> >       soc: qcom: pdr: fix parsing of domains lists
> >       soc: qcom: pdr: extract PDR message marshalling data
> >       soc: qcom: qmi: add a way to remove running service
> >       soc: qcom: add pd-mapper implementation
> >       remoteproc: qcom: enable in-kernel PD mapper
> >
> >  drivers/remoteproc/Kconfig          |   4 +
> >  drivers/remoteproc/qcom_q6v5_adsp.c |  11 +-
> >  drivers/remoteproc/qcom_q6v5_mss.c  |  10 +-
> >  drivers/remoteproc/qcom_q6v5_pas.c  |  12 +-
> >  drivers/remoteproc/qcom_q6v5_wcss.c |  12 +-
> >  drivers/soc/qcom/Kconfig            |  14 +
> >  drivers/soc/qcom/Makefile           |   2 +
> >  drivers/soc/qcom/pdr_interface.c    |   6 +-
> >  drivers/soc/qcom/pdr_internal.h     | 318 ++---------------
> >  drivers/soc/qcom/qcom_pd_mapper.c   | 656 ++++++++++++++++++++++++++++=
++++++++
> >  drivers/soc/qcom/qcom_pdr_msg.c     | 353 +++++++++++++++++++
> >  drivers/soc/qcom/qmi_interface.c    |  67 ++++
> >  include/linux/soc/qcom/pd_mapper.h  |  28 ++
> >  include/linux/soc/qcom/qmi.h        |   2 +
> >  14 files changed, 1193 insertions(+), 302 deletions(-)
> > ---
> > base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
> > change-id: 20240301-qcom-pd-mapper-e12d622d4ad0
> >
> > Best regards,
> > --
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> >
> I've tested this series over a large number of reboots, and the p-d
> devices(?) do always seem to come up (with the pd-mapper service
> disabled) on my Thinkpad X13s.  One less service to run in userland!
> Tested-by: Steev Klimaszewski <steev@kali.org>

Thank you!

--=20
With best wishes
Dmitry
