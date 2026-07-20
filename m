Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BC71FD4
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 00:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784506626; cv=pass; b=m3i1INW7AbNdFDpK33xXIq0v6WR4C0GfklXJRqHZHziJ7TSvMfalfi+E0mH73JX7jWYdsubkjtusYAnD/okQ0mTnQmw3ph2GOyGe8SjE677iUuUJixf9c1eiIZDNef2oi2vWOOkpFBz11PLm47uRZiEab+zbvZcJ/M4qieZyA+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784506626; c=relaxed/simple;
	bh=O9cP6nGCNqeHN2Xq8wqQS3LjGvGODOTi/nxM+kFvsiY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Wpqt2dEQS4ccE/7c5dP75GbZLq+y7PFH9Vs8Y7M/3SHwbzBl2j2I3as8JjlmLYUo6iGLS6GyYCoA5xiJNDK5+POqVBBAfWI4LVG3lUbZKcFqcEe3/ETw/055iopSt1Ne9RwluxNTzyAnxqM3bSMn6gFzcTGs0fVokX8en2lDKak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr5a9s6a; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr5a9s6a"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81ed2a00f12so68316577b3.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 19 Jul 2026 17:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784506624; cv=none;
        d=google.com; s=arc-20260327;
        b=oSwK/F92TCGPtSdxeX58z0Ptw3PK0JX3oYWNUhfmWeSYcfsdtgOUHwhJ1bqSUFayuG
         cUxtKEUkh+qkTAB/1bjywVfwsK0XFnhPf4FVe4etwVaFe02L7OzwqW+toM36ZN0aYrEO
         nqBORlULA93YPFurGGhR34v5SYEiTG5hXPT29e5fKaGK/MuhTdiecRrTe+P4AEvKouQH
         yJXvMeHbkkk1RBReyDe0QvRlt1XVYu4r3bk4m3MgJQnBHSWpQeUEdUO/dpdMpa/KkbiC
         pRGWR4bNaLLn5YXfyTCum0/S3/DXiRS78a17L9DXyXT/8adocEF1kVIhdrSS2DEfkyWi
         h+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=S20JVaLKnRGihstk26kL2qltfogiNg0YzdjITHbQXu0=;
        fh=FwlTtNH8hfbmBYww7vnCx/fOJTEpnYMMg7Eb7qTph/U=;
        b=J1EYwz6XgtYJMFfRSTCLxOzZqaguqRHMlTKADBk3CRlsdKItUqrWv7cUqjWv1IIPrx
         mkeo0Fp0bvsuwoS8pyaWTthtjUxb7/zTz+NhnbNhAyvA6MvhRx9JQ7ot9FvwABQ3b88w
         jVlIPoO2aWsec6N1bvofA7/+r3Yij1kf/Dl21Vt0QouZjilMg/nnScowQpnPRn9OtKrh
         1X1oMEE8KSgxskL5RgL+jLf8y4FjXYw5k8qiJJ32LcXHfko/9daLsJERjC58N9kJomeZ
         35D318sa/TpSMwOb5xrFhmHqZoh4nYcLDCMBaes9xjyJYUBebpHn5hcO+5+m1nX0YYg0
         oZRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784506624; x=1785111424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S20JVaLKnRGihstk26kL2qltfogiNg0YzdjITHbQXu0=;
        b=Pr5a9s6ajjbsTsGEp1roOGYMM2xJ/4JbKUa4XMPKBK2tnBRzv/K3WvmWbEEIag1aoS
         JsdwlZfc5GyI0Gk9TroTIhm9Fg5K6mj6LlYH3F1WrTtkc7yw9XlxbYuEqn7h9l1Vt3XH
         lRVYQEzXF/atecafyK1sgb6LocTA1DsymaWuDr6UlRrsgcxkkrre7MN4OuzNImvCJpjo
         l4hnmQenQREbP8uU0VMDG25c93Hqwvd5tRFgSTv5AszbhjHBohVyJb9o4/8L1Zkpb6f5
         8MzFSjLhplMbUXA2yfdrlxxELhTF36W/ktX37n0doohE9DTXD0xf+Jo/tvQkvvQsp3qa
         asKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784506624; x=1785111424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S20JVaLKnRGihstk26kL2qltfogiNg0YzdjITHbQXu0=;
        b=DUzaVGPD2lmXaNq/T3QhPnQOqd6Uce9gjhTefpNQO21zBgo0MPi6YBsBFAnQ3W4GC4
         oo8Ny8bboL8oFTLW6NFG/HYlWI1g1LsHzJoLbKbO32U28jatArIhdgJdnUba25NSd2nM
         mag7Sd/cgxx/JDBWjWOEq27Jm26YKNneYyreipzRGcVvIQe+aZStD0bZQKp6i+dhPNbd
         C1epvBsehfNNHd1CYpJ2zuF1zzZDoeDtGQmyke01zOqZRHFhr34L8qNYNXunVPpmYMBa
         MOfPChjmmFtCnPMjR+Zt1Y8XfR/rIN5xvRJ3YAezXJRkzvMH0Qb2q+wV4Oi+TMTuetrA
         sBLw==
X-Forwarded-Encrypted: i=1; AHgh+Rpul3JCO5B4pJhHuqh971S0ipvPg/8A84i6GKW6No9zNSRfYcIjdafhFrNhiVKVB6Ne/+MAnTP1XBjPl/IfPNBs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/2sldJA94ajbCWbMVrVfqhe9Y6wPxm8jxm5JSjOczsggF5CoW
	OuEbabyIIA0Zoirs3PTYUwbTqj3ufv2uyojHIcivqtkDhveTrMiTSvzA90AZk5xPiPah7f9Kro9
	DiGmtcB2pkKN/PHn0gr50SExLl0fhrVc=
X-Gm-Gg: AfdE7cmTLu5ZotUlppKiMGiAK9Zkc1Q6m0iqbS/KGvjXLtKs3ud/zkm2yzTY045l6W9
	WTgOxO6a62A3sypMsrBvxsQyYMiAkRbLTKshZg8oO6JhNpYlompGcJvIKoDH0R+7AQhmvOej01a
	rVdCxCXMRRf3l+2tZKvI/dJdsZBj1reFcTOcdzNbMYkmkLp9J75mIu0Y8VfMUqdrntqgJuab9pR
	v1h2gUZ0+jpM8ZwVFtYHOQfun23x0vprfPNY0LPRt6qN//Va1Xsy0MRca2j3GZIXk1PqMM5AMt5
	OwwH3XTCTUda4LEaxbulYgstLlA54w==
X-Received: by 2002:a05:690c:b9e:b0:81e:d000:b364 with SMTP id
 00721157ae682-81ef288783emr38868497b3.72.1784506623642; Sun, 19 Jul 2026
 17:17:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?TGFqb3Now6F6aSBMw6FzemzDsyBHZXJnZWx5?= <lajoshazilg@gmail.com>
Date: Mon, 20 Jul 2026 02:16:52 +0200
X-Gm-Features: AUfX_mznxPsRpnpalvP1z-mBxFg7xLZ6MbxIhdS_1lAqtpMcu-Hb4Vp3hyS88LU
Message-ID: <CAAD3nBebR3GPbufLyc95QVwueLBUWmGpxQhqtSt3EBEswjpdVw@mail.gmail.com>
Subject: SDM632 SLIMbus: ADSP framer never gets frame-sync under q6v5-pas
 (works under downstream pil-tz, identical firmware) - what physical
 precondition is PAS missing?
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Srinivas, all,

On the Fairphone 3 (SDM632/msm8953, WCD9326 codec) mainline SLIMbus audio
is silent: the NGD reports "capability exchange timed-out STATUS=3D0x40c
CFG=3D0x0 INT_STAT=3D0x0" and the codec never gets a logical address. Same
hardware works on the downstream 4.9 stack (A/B slots, same phone). With Cl=
aude
code I've localized it to one register-level difference and I'm stuck
on the last step.

The only variable is the ADSP boot method: downstream subsys-pil-tz vs
mainline qcom_q6v5_pas. adsp.mbn and its devcfg are byte-identical; the
AP-side QMI sequence is byte-identical and ACKed in both cases; current
mainline HEAD (including the merged qcom-ngd-ctrl fix series) reproduces
it, cold-boot retested.

Reading the SLIMbus block (0x0c140000) and LPASS-CC (0x0c000000) via
/dev/mem on both slots:

  reg (0x0c140000 +off)      downstream/PIL   mainline/PAS
  FRM_CFG   +0x400            0x000D0C83       0x000D0C83   identical
  INTF_CFG  +0x600            0x00000001       0x00000001   identical
  FRM_STAT  +0x404            0x060D1901       0x00000000
  INTF_STAT +0x604            0x00003E04       0x00000000

LPASS-CC is byte-identical over the whole aperture (SLIMbus root RCGR
CFG=3D0x509, branch CLK_OFF=3D0 on both -- the 24.576 MHz root clock runs o=
n
the dead side too). So the framer is configured and clocked identically;
only the status registers read 0 under PAS: INTF_STAT bits FS/SFS/MS
(frame/super-frame/master sync) never set -- the interface never acquires
sync on the physical bus. The stock firmware's own bring-up confirms it
waits on hardware: it polls the FS bit, times out ("Hardware failed to
enumerate ... (FS:0)(SFS:0)(MS:0)"), and its subsequent HW reset succeeds,
so ADSP register access is fine. The firmware maps no separate PHY/analog
block. On msm8953 I find no AP-side lever either: no lpasscc, nothing
SLIMbus in gcc, no LPASS GDSC (unlike msm8996, which frames the same codec
family under PAS).

Two questions:

(1) What physical precondition (rail / reset-deassert / pad / LPASS-interna=
l
enable) must hold for the SLIMbus interface to acquire frame-sync on
SDM632, and where does the pil-tz path establish it that q6v5_pas does not?

(2) Is that step AP-reachable from mainline (SCM call, reset, regulator
vote, clock, DT), or only TZ/PIL-internal -- i.e. is this fixable with a
kernel patch at all, or does it need a vendor-side change?

Full write-up, two-sided register dumps, binary diffs and the annotated
firmware disassembly: https://github.com/msm8953-mainline/linux/issues/255

Thanks for any pointer,
L=C3=A1szl=C3=B3
