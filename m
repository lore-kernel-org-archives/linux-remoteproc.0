Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795434262;
	b=TBEFfpyxBw+qvv7cSXIit1X2+fF80fQ44zYSp329FuXx0nZSuM+EwkhNp6SXPGa44Wv4
	 6cVUj6sSZVELuUycTJ4ZKeQCfsSRA2dRYcZr02sG99c2QzP3M65q5I6flk55NDUG5eZpf
	 6XqcCJM/5b78NVoHIMe5YuMZaVgUNQtGG5d5aZyOqaxH8Ocxb8UMM7xkSEtgHiva7BJby
	 RXFloIq2UEFWmitjnYko+SdJPNRb91bSWIaK6gimLZ/9R9pvgkJxm7eFlcj8Q4yzFhBss
	 /849RZcoDpMveW2r3+qrYSNBWze81P0sD3v8M/9ugq7WS+Y1MuZzItPUluVIOCKoKmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=jVqQb6IAYz6XHzB6kODTbtIBPH1+CdWu/xpOCyVQK5o=;
	b=rn2LzNlhOMpfM9LA8LUJ/qfBKe3KlzYMbWRpFKgiK2/uneYnA1iZjvKIYs9+wVKZycYb
	 ItNLdGpg2qFIrQtswmdY14j5mahsb3TlKDskAUyXRz1Fp8RoZGxEPIaAeD6M0e98YM6Mw
	 qmxfh4j6isLSN0nnxIWCzSMWHhuxB/4MxXLhWbxHiLokQsMWoKOSnFuhEMK8oMgv0vxsI
	 EA8yLvRdoDAdyrXvtYLRmkR+evOuA2H0jiBzejY5Tg5jtGM9DFL7jCsgFIBOfAgnaGvqf
	 xlh5iaibz0evDgMp03BWD2ASjWzsJcyvRgRLcyrRs3ds4GgDTH3Bt6ovpBdnf4wX1XQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s91clTBO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A76A606A31E
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 11:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A76A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s91clTBO
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b244fb7fffso2866622c88.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 03:44:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795434262; cv=none;
        d=google.com; s=arc-20260327;
        b=e0qZldpQYj14005nxVsvqnivR7oxVv/e/fuakbc3ehA9B7MR0dBykU9icerN6Scqwt
         u2qVNomuy+p4LEqnTEUM+MNDN+id7NCx1wbUigD2Qs5XsaWHrzsdpVDsICMPjeEPI7vr
         ohML30jtUwtpSGmifDVBmKT647zsziTGYRLdtnyXls382RFf7CXtZv5dyTAQDSQDtHn5
         Zfh+DG5G6QVaSh2AtFc5CecmfAGc981dQgErytpHlVxWbvdL7SRcyvMo3KzusK8v74oP
         pCDBptj8/Z9p5jktE7iVQV3d8rpNHfyQE1Y6rF2rhIjuSwrTNBL8GkO3go3UtV56DxHX
         Xpsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=jVqQb6IAYz6XHzB6kODTbtIBPH1+CdWu/xpOCyVQK5o=;
        fh=yWIFIE0DVRr9g1nf0KOyXo5eDCoX1y76+zCLDDjHIWY=;
        b=OIznr5DbqVcCPYDtZbt8lGh00wWg9l91tKT9l2yyrcgQ38i2hfOM7GbL5YSfLQvzy0
         T81TwM0edAJuwqWwcCgIWn584SCi/Hp1qRZhtrO4ifE2M+PJvPsNG4YEGF1GI1JetiWl
         NUhmDyf2Zi/+ENborzQSphxoUlMVIWXBMtbA2uXWyYI3MCvZ+E8R7IqbcKFJZDnl1qok
         j2PF0bEwEHw1xag7yQQbSUlj2A005QXdjyySnkFTGtnHol/qSTjDPdFCXIticzOYlp7f
         CyE42bQGYJcTlm+napSRhQrOl1ZYj25lFUfUKMa0Xk/Yefi+nRvOgOkwLQrAxF3jx+2O
         yA6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795434262; x=1796039062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVqQb6IAYz6XHzB6kODTbtIBPH1+CdWu/xpOCyVQK5o=;
        b=s91clTBOrFYJlmEGb11shS4JiYc/WhprTXdBv6YgbmJJwpXJvBWN1FjVW3FIM71ARf
         JH32mWvawIsgtAqmtDbedL79IMTd60iR6QDp8J1CR2aNcKqSog0mtf+ghBRObWqITQVB
         8RjsXw5MxAze3nuM3jzZDCXPmhcO0t+4/MYemvI1GwKvG7TvYVWcA3DX+XWhj7wMd9IL
         Ue2Bn1Oi1Ep3d+3CKvb3WBg5SjMrSeK8xFUgCa9OZvQ1w1h1r9a2PEYiGSini3uIL4K7
         BxLepcgWHCm0yH8kub2yEuxsB5gC/Ygweb9Rc7q0C8DrtMw/NY6Um5855FjuGxhqKRG1
         qbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434262; x=1796039062;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jVqQb6IAYz6XHzB6kODTbtIBPH1+CdWu/xpOCyVQK5o=;
        b=Xmg1sgcZDBJKL0IavN6sluocz9IofrB7R03aR1oKeVM+HWu/HuBXdK2abGpPaD9rTw
         YwbxvKvO5bmuNfBCwZ15zDPWidwbCREKqZoEV9SHwYa8jEuxgZXKMZzhhjV5C1c8Cm68
         lpN3bJ+7A4YK+rrax9DCCusUgZ5n1YJxiETd4Iql8tfmfWtAQsdRIWaoy42Tt9F50IbV
         9XvInUbGTYu2ZCkceV/ij+836hokZv/ugc7cU8qmtpqMaZ95Zzi2LYVMxWHQJf9jyy7l
         f1ueRUjaDqpr5A6k+BAoseIl74fesEBLe8ogCRAfEC7+ogDencOOm0r41eZXtAt6UFwB
         vlcg==
X-Gm-Message-State: APuU4Z/MxMqx/aKV45cd+2VXBY7S+RNcThQ8kmwg4f4DkTBMyyCnmtn2
	F8g5e3cukmGyO8xgS5VR0R9Vk8rh61ksZm/Wg2hPMu98mLnMs3pDkoBHnv7ItW90/F3yN6TNHHZ
	Roqs61lLO7D5U1O9ouKOXPQWvN2O5FBDDZA==
X-Gm-Gg: AZFdTZe/b7q/2fiIXU9WasbA8fgoy8Hk1T9VJqJJMq+jj34GRdiuW1Wek4cQ8C6hWIZ
	DJJjVpQQuT+jqlb4yGRYUbLhGfSBHEaSOAJF3uIm+NIgZYAE2MaoDOOHrrXeLdsmKEFin8eGPq5
	NIfqb1h/RSL7oUaZlhMUNECIPH0bT33dCtemh/09z83Y9Zcf/2w4h7FhVBPsQanJMVF/s9Cov9E
	GX6l/bcLPDpl/Ia3lXSkEAHYfinlaJBMmjeCgps58ZmChk/Xa8rdyK28kWV3gGnwtS8vZM6EO4e
	c/oETbCJEZ1xT5V7dQ+NTvfbhi9GP2IEyWf4UkBAg2cVYnBBpL64M60GvTXQpi8jbobwMpyDxcd
	WYGUSEl1JzdpmYZFxKeqJVs03fwxMJ4QiiMFygSgbQ/+kTQAd9ugoaCxDGw==
X-Received: by 2002:a05:7022:ea26:b0:1b5:58e:b547 with SMTP id
 a92af1059eb24-1b5568aa9admr13478912c88.22.1795434261509; Mon, 23 Nov 2026
 03:44:21 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 23 Nov 2026 06:44:20 -0500
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: lenharrisonau@gmail.com
Date: Mon, 23 Nov 2026 06:44:20 -0500
X-Gm-Features: Aa3M54pGe57UGOT4b5_BqDYwH-Gm6-jpgjZ3sTpobLPxmxooyqh87DX3mpXSHHg
Message-ID: <CAL1FUgaYLWSkdGqXXFmiG2OhNjZ=ieFY+ZGuUTOKNbGunh6exA@mail.gmail.com>
Subject: X1E80100 CDSP DMA completion after successful PAS shutdown
To: linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, vignesh.viswanathan@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I=E2=80=99m working on FastRPC DMA-buffer teardown on a Surface Pro 11 with
Snapdragon X Elite (X1E80100) and Microsoft Denali CDSP firmware. If a
mapping RPC times out, the host can be left holding a DMA attachment
without knowing whether the DSP can still access it.

I saw commit 9db31edf92dd (remoteproc: qcom_q6v5_pas: Fix error
masking in qcom_pas_stop()), which preserves a main PAS shutdown error
when the separate DTB shutdown succeeds. I=E2=80=99m trying to establish wh=
at
a successful main CDSP shutdown means for DMA.
https://kernel.googlesource.com/pub/scm/linux/kernel/git/netdev/net/+/9db31=
edf92dde1f3c98008bd5f88e859d14324cc

1. When shutdown of the main CDSP (PAS ID 18) returns success, does
the X1E platform guarantee that the old CDSP instance can issue no
further DMA and that its already-issued reads and writes have
completed or been safely terminated? Does the same guarantee apply
during crash recovery or after an orderly stop acknowledgement times
out?
2. If PAS success alone is insufficient, is there a supported
isolation and synchronization sequence that provides this guarantee?
In particular, what completion indication should Linux wait for before
unmapping the DMA buffer and removing or reusing the context bank?

A reference to the applicable platform contract or an existing kernel
implementation would help.

Thanks,
Len
