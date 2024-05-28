Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016604501E
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 May 2024 07:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716881192; cv=none; b=asCVr4M5rjMdWd7ExhICiOWoYw7vixH2GwkfPDWd08WOBCHADsyylBlrgMPyonH6qYfKZZ1/YlA8K2O2shqw4Bm0zIraWSjBQOoXHXcNKxqJ0AmXrEEohSfplSL74SEc+HGvLaw/hhvo1rcR/Vuia9ya7qwppss+oQfqIXTDz1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716881192; c=relaxed/simple;
	bh=Wb7/vxmVn2sLhr5nQIemWiJRmtkq/q6L+aljI3e6J2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vi4ce0RG/EBl1F3JWDrwEQgTlWxNecj8Wj5Ee5RP6XAwTJ9qEut7BIW2C9gnDhVZrdVvsm9JgtsrSEKOQokG5UItVqFYuPaAGXAb5efNM8kpXLUxwhr/6/WEp6zAb1l2Ych8QUpm+U/I2AxsIsS2CkadpLd9dpQeuKIuQ9o4c/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nZNYbyvQ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nZNYbyvQ"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e95a1f9c53so5620211fa.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 May 2024 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716881189; x=1717485989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wb7/vxmVn2sLhr5nQIemWiJRmtkq/q6L+aljI3e6J2Y=;
        b=nZNYbyvQouo36WbOzltHwO2RGZZSFKaJqbl3qhxdfNjXXlovCDkO25r4k//d7AVgDB
         tR+h5zVO4C0IlFI1t7E374z4KcJfQ8qrhQXTtZ2cJuuiN0y2nAYHYJpC7f1nleWTdeiV
         4qN0yqnYrBGVdO9I9QK9HrfGSOiSXb0yuwECs1o8q51qbhYfQLToeh7zhGJZRRexp5pN
         9BIe7+oegzWVdpYDCRVxln9jxokQlnZ/VtEYveMCfJrK6pTXUgoftbokE2h8yhR1qVrp
         AE9doHCra7mR+vLLSW69mYezRiyro16h5JxvK6BgUhAda9aDkMn3DnijrslpneK4FgvJ
         jagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716881189; x=1717485989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wb7/vxmVn2sLhr5nQIemWiJRmtkq/q6L+aljI3e6J2Y=;
        b=eWnAaZlh8Obv49l3p3/b8Z/54gxu9JIUB6bnepV4wPHf7Qqz3l44HZY8ANYj3bAlIi
         cC8JXooHb1VuqcihQNRg2PQ9JKOOlvOEDTJ1rPEtJIEt3Uq/NypFgf0Y/4JknFXv2Cri
         RKweN+No/Zwrq3KYJ9RI66vvhKsz31yVDWjxu5lq8lXIMuYGjpQ4Jx+Kl8tzh0dBHw5K
         ah3XHuy7AViJofzQjSxQw/tRBZwstcM2RYafA/x06OCa9rBPm2YTToq1GiLJGGFRs80H
         KUxP2m3M2O6OfQ20dOTQfXhiIAh/HYJkv7leOymxg+s/G5EN/AY6cO4Cv6sQS8FHPzMl
         euIA==
X-Forwarded-Encrypted: i=1; AJvYcCVIgZ3NzQlb0hplv50kMWNPZgZgZlffIC4Z083IXIyrKBKaLb0Ri+nhFt1PrzgIa7E2bDVoNJyRtLGUUl/OHEoQvgu4r0lsEny03bG69cwDsw==
X-Gm-Message-State: AOJu0YwclfldxaCz+xQtCC5JUgM7tsx8P5I6hvMNuVopD1vrDWcwMtq3
	Zn63mC0aNbGGTYhuOjJUhSiFNsin5kjMMrjUGyzzeMOPemYwhIpVKQP+0UeRa7HK1VfTjUKsh1N
	Seqjjdrguk0i7aW4Lsra5jIu8syRHzw1vU2cbEQ==
X-Google-Smtp-Source: AGHT+IEqwG8lGB63TRtEHQ50qoCp6W8M3rlfT/je1S6Zp1mGlceEHeIquoczIa/UPZy5YbMAUDrdbQWUFj+EH+rU4f4=
X-Received: by 2002:a2e:83d6:0:b0:2e7:1b8:7b77 with SMTP id
 38308e7fff4ca-2e95b0c163cmr71809171fa.22.1716881189068; Tue, 28 May 2024
 00:26:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
 <20240527-topic-lemans-iot-remoteproc-v2-1-8d24e3409daf@linaro.org> <ae768bb2-cb96-4a05-8752-66bc6bfdab1b@kernel.org>
In-Reply-To: <ae768bb2-cb96-4a05-8752-66bc6bfdab1b@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 09:26:17 +0200
Message-ID: <CAMRc=Me9B3H9NM2VKrVSSce0-o=ZZuC2TQxt7eYLD5aWEKy+SA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: qcom,sa8775p-pas:
 Document the SA8775p ADSP, CDSP and GPDSP
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Alex Elder <elder@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 10:56=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 27/05/2024 10:43, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Document the components used to boot the ADSP, CDSP0, CDSP1, GPDSP0 and
> > GPDSP1 on the SA8775p SoC.
> >
> > Co-developed-by: Tengfei Fan <quic_tengfan@quicinc.com>
>
> Missing SoB.
>

Does it though? The patch never passed through Tengfei's hands, I just
wanted to give him credit for the work modifying the sm8550-pas
bindings.

Bart
