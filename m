Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034284;
	b=mS0OQ5BCYl41jXV6dAkdx/A2YwUglCQK8ll318oHZjbQJKap3mEr6E7RQIr+vW9nQhxY
	 IVRmy+Z4H62K5XVydBOqPP8Mex7BL1lOoRELIConeo5Oc61GEtQIhrQ/Q9uHpq8ZgQFP9
	 x5uq+D9Iq4EA9tzpxw7zNbY5aisPCYh3R+ltUUEANBTawUvdf7kWMETpaMQppxH8Sb07W
	 s9EJc3f6AqmTJPYYSpm/szp7gFRX2+mHnvMz/4yegeuCmxrNrHXZr1LlfZZWEifuwH33D
	 Hez+rF/tIq25qOVGeWZZy6bDQRCGyrKPAbTKkK8qYnDqwb8oH0719PYSMgAqT5AolIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YoDhXeC9eAY7IXgT8Ctr9LEdWE8O3Jm6he0UDGeXJ/c=;
	b=rMMnIXO3ZPiloDwldf8l729H0vQr1FXTHmI0cEoXIQC6OZsZvETjMbA0BfoFfGc5Sefh
	 tKMzvI7MjoOg7yQfrDG+oIyzojBu5aKO3NNBr8n4aTXvngp4KepbKn9AjqhpU+GTWNZ7L
	 aElNrd6H61Y0fM+yTiyjOxy7IDQSE6HsasHNIQIskyB12BnbfBM8Hv+zo6aSBPFQuuKYH
	 Zbe6oGFXPpsJTwELbSVAjgrYtnSxTTBdA92zSlamPAlAOMSrTDVaXy4iBpzXSIQwjm4Ox
	 YsRzEa5YAE0mYRVJ9FsTPXyGMsbE4KBgI/7H6s8y29MzI4VvKdhsb2CNxbcoIAf0ZHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LTYMQlHE;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9D8606A320
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 20:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D9D8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LTYMQlHE
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5495d549924so16014091cf.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 12:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034283; x=1795639083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YoDhXeC9eAY7IXgT8Ctr9LEdWE8O3Jm6he0UDGeXJ/c=;
        b=LTYMQlHEbQdTlKUxPBuAzs7VvXrbF1oiYVatGoqHremn64qVP2+VtOWCtRF5qWcysZ
         l5agRzunf1PTVH+OhcBmq9jYrHAzemjz4WyV3wBLt36wZrQ0x7fPwVhjlRLFVGESKxPf
         +/4B6655MaEsnAyT5EMT3L3L+5LMMNqr7/S/RSS3WUY0tltxdQDvgW5sBwl/iDgiaEIt
         NlvV7HMBuHOAHp6Gijb+5GONLMQZNPRG9xI4O5mYqn0+7y/TECNF/vOwxcJscQJ/bRbn
         Vlqk5jktTZtNoIyio7RbDVQL5gsV3UILZXv8IJLnDskLLzk55xz7abbhpMmUb8SqWpqp
         A9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034283; x=1795639083;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoDhXeC9eAY7IXgT8Ctr9LEdWE8O3Jm6he0UDGeXJ/c=;
        b=kwZYk1qqo8Hpo137wT82yXrZlEAd4sZI2Bb20976dzDOZFQ6uptTQSY4YkQKE3m88w
         GG7q81MvUisimo20rIlzLwUOmyLV3iN32yHI/hxgjeugtlUAF9wU4PfGaIeM6qgjPhVD
         VzxlApmdbOkJgDbBxTw42uXIhz3yZZk0qHUnH2CnMOAr8OTgvRgbCfAq3RONkjBJLJbh
         O0uJq8gv0OZPec8IKxZg5r8OJ8fMYXgdKyRBZleV9Mxzpa/Pf6LuboK0VFuymGS2AdGZ
         mSBvjSWuDcP3nicuaTjOfQpGJTocDrNjdatNTmBBS7rxoAhw467V2syJeC/U6EOjPBj2
         aY3g==
X-Forwarded-Encrypted: i=1; AL+hErGFNyq1OAvUjxANF7f2akWnMNilo//b7LSuJDjg7so4KKQ5EuMN503BS8ZFiUOtLuuRu8TJr+1cY0BIg2XCENzQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8P30xRg9zcbViihGraiX6pyvQyPZh+qeT3k29gZ3W+xrBf9lJs
	67i+4s5kUzgQ6PjT5wCcADRX+nDeies9u3fxbt0pV3OGzRaBgH7lXJN5
X-Gm-Gg: AYBFou1mbej3ckYrcpElJDgfLOKjqqZPnrOVpV3Og88ShccCtlPZOImV67aQkG2nclV
	ECD6QXDs+LSSiluB98nR5hlD9bcfyBFT7AVDx6qnrYCL4LrNX58KG1N7dcZ7fM7z/4uCxa4jdvR
	y83cLMvWGlRpHHbqcweC6LMmIEsPrlmNgqizeQBnBHEJqhAosSKJOZItFyyJdIJYCi/Epgci9dj
	RTFRog7lLO9MoqEvYVNnN3Y6B7K2h73EZ62J86Lr5Csq0A+VfIdhrNjmcc91uAZu7EOw0NbWgqa
	x5sNIWi0BD3DawqXIBkca+2Av6q4ei4kEpR4EV3/zHwbXl2Sodqo39ZzaRDW45yWl1kJ/cCxWn5
	kiDDqsJMQnQawpFZv7VDLnxXXxcq8keOD9v8AcTMfHOu+XzhqKMkKCtJ6jpaL3Su1we/Lalrzki
	r8Qky2WkYakRYylc72i5AVXCkMCqnZ8joraRZGH3ij1O3gL7+3F5CsQEIJCrOUtNTXVrdqIighR
	V+r1ZtSUtUMnqotgGH/Xe12NGRZhuKLTnR7938x/aGsk4oTqqppDiDAeW+vQhO+ivk3VmPF9ZrD
	amqziUYNbQFu1NeEG0fT2dtGGKXWcg9ksfvwkX5Rg8nIAfHM0Nx7nXNEFmALmmZDsvIIBr8sCR7
	HRd3CPUKOyhw9MlM=
X-Received: by 2002:ac8:5d4a:0:b0:533:370c:7600 with SMTP id d75a77b69052e-55d5a57da20mr64973751cf.27.1795034282998;
        Wed, 18 Nov 2026 12:38:02 -0800 (PST)
Received: from localhost (bras-base-toroon2176w-grc-63-174-93-36-89.dsl.bell.ca. [174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921149f58dbsm30837106d6.6.2026.11.18.12.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:38:02 -0800 (PST)
Date: Wed, 18 Nov 2026 15:38:01 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 7/9] arm64: dts: qcom: pm660l: add analog audio codec
Message-ID: <av4MqUrrZ0OgMjlI@rdacayan>
References: <20261107022453.159341-1-mailingradian@gmail.com>
 <20261107022453.159341-8-mailingradian@gmail.com>
 <avubHsbu-zkf5Uqc@zenbook>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avubHsbu-zkf5Uqc@zenbook>

On Mon, Nov 16, 2026 at 06:10:25PM -0600, Bjorn Andersson wrote:
> On Fri, Nov 06, 2026 at 09:24:51PM -0500, Richard Acayan wrote:
> > The PM660L analog audio codec (PMIC revision 4) controls the headphone
> > jack, and optionally the earpiece and speaker, at the vendor's decision.
> > Add the analog audio codec.
> > 
> 
> Trying to merge this on top of linux-next gives me a number of
> DeviceTree validation warnings related to "sound-name-prefix". There's
> also a number of warnings from the later "arm64: dts: qcom:
> sdm670-google: add sound card".

Oh, sound-name-prefix can be removed from the digital codec and the
sound subsystem can just overwrite "PDM_RX1", "PDM_RX2", etc.

I hope overwriting the analog codec "PDM_RX*" doesn't break more than
what we have now.
