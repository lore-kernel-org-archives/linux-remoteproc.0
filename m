Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9081E255248
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Dec 2025 14:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765464102; cv=none; b=NlarTnZLFXk3dYp/NlIqORg0X/ND404RykUJ+xI07gsJoku3RPUbP8oZk7YBAMCbdVnDFevwrFp/hJgA3Zi36BGzADzN0TAIUjOnmkZRwVzUJxfeG0rh+x7t2a8cUJfMadXbh4uufONAy4pIQIvNFeyGXfoEUVwSYnCt/JWEv9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765464102; c=relaxed/simple;
	bh=XL08wq/Gpmij7q/EVlU3oMvW4oE7BPSYS0rC8uxEoyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdxdZuZFrPwfl0F40mlSaHUANc4ThD18Wh+F+knJ0P5DmAQgMHy+BCKPkPBRz6QNdPPhoMz3ulwr8b9OZQah7ioAnL6pL3ZEi3BKJxMhqe1eZPMQGcbGsWK2BzD3TBfaZIvt794NX05Ds4A+DAtuuHXpIop9GxIgrW/cXyNkn60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YK5j8pQr; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YK5j8pQr"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5958931c9c7so205193e87.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Dec 2025 06:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765464099; x=1766068899; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XL08wq/Gpmij7q/EVlU3oMvW4oE7BPSYS0rC8uxEoyk=;
        b=YK5j8pQrSp19WFlSsShgo5pF1l74Owhrzfy81Qmeoz7jkXoSK+nHX+q1uy1WNzXcfA
         bJYdp9DavVMCNDkxA0802rfW7bVS3orM2QsIQs4mXOH9WmPpGMzS6jylyjPW+ncHq0Ih
         IngGy3QhsyYH55xHt1cEaijdQuWoPUOIzPz+8b8IHKeJcWS0wxkMW/mqmIWLJ2OQ4xN+
         xXEZJ035bT8ciuX1cOXurRCyk3zEUDCwHaxzhHBveslyhv9aNYAouNilUJ5xv1VoQ602
         E/RNghQdGnLXpkXg9LUGpyLac1wStq+KqfKqv50Kfn8cpsZX8Cy39gmAFIRggo9utTNr
         0lyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765464099; x=1766068899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XL08wq/Gpmij7q/EVlU3oMvW4oE7BPSYS0rC8uxEoyk=;
        b=YBPtseRihFxwzAuBFHqnski4Z4z37QyX4r12PWb35lM+RD8BWZi/4iKrvsC9rspb33
         n2czLOxJG0Ioqe4j2O3BYFpv5McE8ERBuMqhs+7ABCUSfj9YacKRcOV5DSjEu8ed04A+
         yDjUiJOg0IBW0U2tahvbwCfZqsob+T6PK/mTY7n1GiOh+A+fYxhO9KFhP/zh2lO5oXNF
         MlJry1VJNA8jaiB0utuVEUkAi+0eaiqubU48C0/fiKnpdZCQ25Nml9NFkBWplDmF2Y66
         3TCb8Ev2vREakdJPpeBee4560Ml2N1NhhTUrHwtgLGD8Xz2+dNC51cJDaACqj+j41Cya
         46uA==
X-Forwarded-Encrypted: i=1; AJvYcCXJb0XBkPNULHn6lmGgpwJ0G/80fvOj8Nu8svBxPXh5WnCik5nfar/rL6bqcZNPduD132NydlDOmriWAzE9uAvy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/hsCqLpCFXyDUtwqQ8gGARd8Y+Ir7qT5yjMAaRx3lpf2xDhtj
	Wt/2fUFfDojC+7VKcjLB8IYmXZa84GRo0477On2WwLrkG0rkc7YO36RY0CGEto+NL50Pw4ZwC4p
	HYBgMRqGsfF/aSTNevLcM30thLKVTEO0=
X-Gm-Gg: AY/fxX6I25iZgp/80CFTSoJdl731wBQQJ7t/3RJ7fM42sgh2jEzaHiXZceWgvFLMXZy
	DFkb1MkJ+h7v9NFIVlshEXkr0dsrnRQH9ytthwL6w9FQcKYmkwTWIn0Eh/Dal9hHCbCfyuBAk8g
	ImVwcrUz+adP+0rJ0RDn7QbXsOGe9NHgqJsDxBrFgA/R12agTKtZ3upLBde48DTg5ILYFh/O33q
	gBkW0bLygAAimDyAF2Y/0CWXW8PhDtxA53EnLzQPCwDEmOhByAQnlSuPayWys8vN8HGlXk3ZfKL
	ez58
X-Google-Smtp-Source: AGHT+IFiIR+iIsV4mJ6qVbYZvp4StuXMH2zma5BiBkgrZg+TTdcuperTYP94aUirT3N2xa/3hEPBPBBlokr7QfLebLc=
X-Received: by 2002:a05:6512:61a1:b0:598:f85b:b12f with SMTP id
 2adb3069b0e04-598f85bb2f2mr223765e87.38.1765464098416; Thu, 11 Dec 2025
 06:41:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251207-adsp-cx-fixup-v1-1-0471bf2c5f33@lucaweiss.eu> <d81e017e-e317-402d-a4bf-7ddfa033299e@oss.qualcomm.com>
In-Reply-To: <d81e017e-e317-402d-a4bf-7ddfa033299e@oss.qualcomm.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 11 Dec 2025 17:41:26 +0300
X-Gm-Features: AQt7F2pajj9Y1bhJt30iOkjeSJDSjern_i-FqbzQqEVWSt5mgRNTFkDTUxa7MnY
Message-ID: <CABTCjFBQOq1pmdou_17ZOV3MgTxD_2byAY4RitqPVN5FYdRuJg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,adsp: Re-add cx-supply
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca@lucaweiss.eu>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 8 =D0=B4=D0=B5=D0=BA. 2025=E2=80=AF=D0=B3. =D0=B2 19:33, Konr=
ad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>
> On 12/7/25 11:35 AM, Luca Weiss wrote:
> > Some boards (e.g. sdm845-samsung-starqltechn) provide a cx-supply
> > reference for the SLPI PAS.
> >
> > The Linux driver unconditionally tries getting "cx" and "px" supplies,
> > so it actually is used.
> >
> > Fixes: 3d447dcdae53 ("dt-bindings: remoteproc: qcom,adsp: Make msm8974 =
use CX as power domain")
> > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > ---
> > There's literally one board using this upstream, judging from that I'm
> > not sure this is a misuse of cx-supply or what exactly. An alternative
> > to this patch is of course removing the usage in
> > sdm845-samsung-starqltechn, but as it stands right now the patch under
> > "Fixes" introduces a dtbs_check warning.
>
> FWIW that's likely a hack (because IIUC it needs to power up some
> regulator for the sensor devices to work) but that's "fine"
>

I confirm this probably powers up devices, because firmware boots fine
without cx-supply.

--=20

Best regards,
Dzmitry
