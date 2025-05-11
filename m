Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F209F3BBC9
	for <linux-remoteproc@vger.kernel.org>; Sun, 11 May 2025 01:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746925774; cv=none; b=AjLjhLxctY7Xa2TaEULgAQQsU8S+suOflOvNgp1ieqfmkltVnZ0xcSx3msHOK2HCH9+T5DTJ+3ff3NXjkzLNEoT+/SaDkyRBxiQT23o4ZlbeTlNtTTF8imwYsDq936pywdF333eKxCEKtpKk+sxx120tqaGjZtfO/5je0/5tYwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746925774; c=relaxed/simple;
	bh=4MedhLIAtxfBJ7juzuHcFhIJgej77smd5W6HDM2mc2A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To; b=uxeg2k7/okMH9BBEipMujiZaYtpdqZQmUUb9Ds0I6cb5OXF2xIVb1OQVkwAGZ3ptbAYde3Qbn5lSA4nIm/3F6bbqwZW1mAKPvtVlDn3AqfSUKnNgNB6pldBoSKI6xk+jlBcx5wjcgqi7dl7IByk3Ftwqig5CobrdatNGVdXNFiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W+GiUOj5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W+GiUOj5"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a1fb17bb8cso1410381f8f.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 10 May 2025 18:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746925771; x=1747530571; darn=vger.kernel.org;
        h=to:from:subject:cc:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aqCWxzc/LF4mwbSHgXAH1Y8wfV3w1TZlyAnsWm2HFII=;
        b=W+GiUOj5WfkRfGvWhtiN5eyPwE9TKhTFh65CZGrhDQQX8mzCJOjl1XhkQJztvCi2VK
         bzMDpCc9E9C4M4uewBbPBWBOg+xUi6ELlw0sprMjInIlnBXRX4tLzTZ0/n0TWKpdnRv+
         mg2H0lqMPXIGFPMpYR6Ww009bbnV6sBNV4uHvSciP1qrVToRNg2tYtlmwiczwXBMO+6J
         Iv7egWnGWBZu8kNtlEqoI0g8fHgmrF3t0B+TjWLa1xPorEfmmhojJsP8o5wMMp2Wz++d
         GDRzwISMLOOhSqmJhQPQTamUM3oUZg17ROAd0cOGP4oIaFfiQZmwNVvnY4H81LG+63sU
         JS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746925771; x=1747530571;
        h=to:from:subject:cc:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqCWxzc/LF4mwbSHgXAH1Y8wfV3w1TZlyAnsWm2HFII=;
        b=fL851XkJxE8gZd4CjHjW6bBbxieWtHmp6qszsj9uE5tyS9lADuNnUJk0tuAF8cwKng
         Ai5O8LhuLa4fEcIC30kdWRpADL694j3p7IYP//dVTwfsaxW03u7W2DT1yoGWECabgVCK
         2Kvl0P+TR2RrMWc+H7f6Zseq77mpfdNkjsaevbvpxewf6QKQIUb81R4jqXlz7ufYPAOa
         3gN+YgDV2XYGgcLg6AtLynTnVVor4Ldg9iXgpenxAATd8OC0OAYTMASgjILzN0Xw5JuB
         JE20OoVPGAlu0R6DAZZHhlQ4IEzE6KEDN/sXwzDLFlL3h+raJ/+UOCv7xio2QdxNwXcW
         dgZw==
X-Forwarded-Encrypted: i=1; AJvYcCXxIQbmtY0uQ48MUuAooY/q9kiCfL6vhKcKinFpn3dha2dYfJA0NaQoPXKH8ZsDpHTVMef/Ch3i1Vzlz9O9Z3+v@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8gClUmZq6Tkw9OhiZSLMxN6j9TIBz7PqmFe6G6o7o9ErIunii
	4D7j9X6DMxuewXjBUsdjPn3uNEgse4Dh1Bfi6X0eoTJMRljxDHqt4nGiDnBX9tA=
X-Gm-Gg: ASbGncvgRutBSsuu5zU0VK2dYFLFuv3yLaeVEVr93y2QcrFjb09rwM3r83Q/4eJuDHg
	rd8WcwHraJkHy/w12henVeZx/E6V369ouns3EQgnMtr07zGhNdwb4XTunxUZsnm7/q4ZbzOwuCj
	56JzFfy9q8HJPMIKKAIIFf5Jxccyi7GVkayppi0rnQMprl77xSVkGFsIHc1MdqSa9MKN8iB1ZW/
	ZoTGnmzWWPja9s3H58JqlcH8S1ODmFEmjXyy2zsD/SfJJPyjCaC+93/xw2kx0QBYk1LkemrcYwh
	r32M2+TqhUcSEcAQ3Fg4I8PcvLvI+IooNMqVxSSKJnrRK3M3R1s=
X-Google-Smtp-Source: AGHT+IFoTmZ/NIccZ5HMBwKYuooZHRaAIWQAsw3sw2JRyk4vYHIQVqEDgdSTxag0Au3HQzPQ4XRVLA==
X-Received: by 2002:a05:6000:2ce:b0:39a:c8a8:4fdc with SMTP id ffacd0b85a97d-3a1f6437880mr6788989f8f.16.1746925771223;
        Sat, 10 May 2025 18:09:31 -0700 (PDT)
Received: from localhost ([2.216.7.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecaeasm7739674f8f.28.2025.05.10.18.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 May 2025 18:09:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 May 2025 02:09:29 +0100
Message-Id: <D9SXI3F82EFT.7WY8FQ9P4RHL@linaro.org>
Cc: <peterz@infradead.org>, <neil.armstrong@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <andersson@kernel.org>, <mathieu.poirier@linaro.org>
Subject: [linux-next regression] remoteproc seems to be broken
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: <tglx@linutronix.de>, <linux-next@vger.kernel.org>
X-Mailer: aerc 0.20.0

Hi,

we started to observe regression on linux-next starting with next-20250508.
Neil bisected it and it pointed to:
2ef2e13094c7510c40833951c2ec36cf8574331a
genirq/chip: Rework handle_nested_irq()
https://lore.kernel.org/all/20250429065420.744042890@linutronix.de

>No functional change.

Manually reverting that commit resolved the problem for me.

I suspect it may affect more than one Qcom board but I test it currently on=
 qrb4210 rb2.
Mostly failed remoteproc start up hence no adsp, cdsp, no wifi, etc.

[    8.937745] remoteproc remoteproc0: modem is available
[    8.963841] remoteproc remoteproc1: adsp is available
[    8.971927] remoteproc remoteproc2: cdsp is available
[    9.027266] remoteproc remoteproc2: powering up cdsp
[    9.037796] remoteproc remoteproc2: Booting fw image qcom/qrb4210/cdsp.m=
bn, size 3008020
[    9.153625] remoteproc remoteproc1: powering up adsp
[    9.158697] remoteproc remoteproc1: Booting fw image qcom/qrb4210/adsp.m=
bn, size 13196348
[   10.357702] remoteproc remoteproc0: powering up modem
[   10.442049] remoteproc remoteproc0: Booting fw image qcom/qrb4210/modem.=
mbn, size 8881672
	...
[   14.508388] qcom_q6v5_pas b300000.remoteproc: start timed out
[   14.508418] qcom_q6v5_pas a400000.remoteproc: start timed out
[   14.522733] remoteproc remoteproc2: can't start rproc cdsp: -110
[   14.532531] remoteproc remoteproc1: can't start rproc adsp: -110
[   16.043271] qcom_q6v5_pas 6080000.remoteproc: start timed out
[   16.058593] remoteproc remoteproc0: can't start rproc modem: -110
[   16.076600] remoteproc remoteproc0: Boot failed: -110
[   20.143356] platform sound: deferred probe pending: platform: wait for s=
upplier /soc@0/pinctrl@a7c0000/lpi-i2s2-active-state
[   20.154630] platform a7c0000.pinctrl: deferred probe pending: qcom-sm425=
0-lpass-lpi-pinctrl: Failed to get clk 'audio'
[   20.165381] platform a600000.codec: deferred probe pending: platform: su=
pplier a730000.codec not ready
[   20.174738] platform a620000.codec: deferred probe pending: platform: su=
pplier a730000.codec not ready
[   20.184089] platform a610000.soundwire: deferred probe pending: platform=
: wait for supplier /soc@0/pinctrl@a7c0000/lpass-rx-swr-active-state
[   20.196738] i2c 1-000f: deferred probe pending: i2c: supplier a7c0000.pi=
nctrl not ready
[   20.204793] platform a730000.codec: deferred probe pending: platform: wa=
it for supplier /soc@0/pinctrl@a7c0000/lpass-dmic01-active-state
[   20.217114] platform a740000.soundwire: deferred probe pending: platform=
: wait for supplier /soc@0/pinctrl@a7c0000/lpass-tx-swr-active-state

Thanks,
Alexey
