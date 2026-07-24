Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ADF3E51EF
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883572; cv=pass; b=QOAFO8Xn6OF5gqRgJJ+Rsq04TXBHnbnzFsuv8+fKb8wgiBWkPqdglg16goHllk6GYnQnbK4p1qPVbDoh1/P+D+OZb3HkVrnFofXJbT9ZNnEFRXz9oEGi/TgJbRsX3qf0cd3P/m4qXBo61Kf2SEDcZVScayt2mcT3GuXD6ocXYGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883572; c=relaxed/simple;
	bh=OSlHh3K0SbxsmVcjUTclTWwSF6F5+ig56meFBxc1GdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kg0eQJP47n/7F8qJR5V+08s8r7RmYr6jeLSyApqmVqKwbPeMu4JxoGNtEMxlTTsxfLyKMW9/jzRJci3F3Wd0DlnAZejtO8vE0jocYfyUZs2gixL+nCkIW3aTimufdgL/90+sKbKaHxKr+7ritLGm1VCoC1M4+H9oiLaStZl7O8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqRtntYR; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqRtntYR"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66893db7bccso126430d50.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 01:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784883570; cv=none;
        d=google.com; s=arc-20260327;
        b=KYmgR+F+VwhJmJEFMZT7P+nsn4/FjNjGaTRhOJVOJxSJZXVKw1li/6u2x4YBVgtPoI
         Hr9ktF/xI34wT24vfe/5jSfoOK5Qd/fwF5dSvse2WrnOMCRo6/wuaeTDjm24PvKNrM2g
         eWs0hGrZtbLwqEcenESJIrUqt2hYomR2KoSbg1IcnmqannsRRf23PLX4iH21ETZtoUVU
         Uf3lCsKZ75hqf46KKTgP0Ny0Mqg18he6YHFIx3LHGIdUFayYtVW15TteQaXpRPa8OjI4
         EpmxhWTSB0UAxDWXpNM8q+61f8wSaPc7SiyYl+huIrT1hp2I+pxWvcPKZu1mfNOi/E7+
         uRBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yBFFefkQzk4oWE6fof8dHzL8U/iTmHqazJ6MZ35iP1Y=;
        fh=6g6B7rUlal9HkYjEV2FeJEjHoA9TAI+6tQijJDgtKGg=;
        b=HLNHvXkrTl2TS4NRvz20BVlntWBOy7dnldhiYTruD6kI/UHuwLndrOe2D6F3u7dJs7
         Jb/yki14zN2UQmJFcAGj4fUAH3nA1KB1wpKFQfEiEMH43k2PXxVcfXo05WlW4UVI2K5n
         D+mgPqAxXbA6D1jMEgtYDDMf3nGzWWz9dInmHjv5dPtQan+x8YECvbJDAlMDQl8DQR+R
         6Up3wcS02XTIGxg90c8cKx0vqVydEyWOtVrPBokSMGTjpw7/IS6fKWItE+75xDrAey4/
         VO4290qqdXkyyiVIWNCYd1MEf/xSsWMDFlV9Bw9yQLTlERNTcaLB1C6D5+JYcrCeak3q
         HPlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784883570; x=1785488370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yBFFefkQzk4oWE6fof8dHzL8U/iTmHqazJ6MZ35iP1Y=;
        b=IqRtntYRzNXiGvI9gEn2EtBPlyABe4dXajbg1wIUQFdnv//RSY1LapEiTraExX5DpK
         htdGybSgAV+5uFVlMm3wuWdV9cR81G+T+dG8xTW8Cn6DGwxc61zWgkTgfUJ8kTSmIb5z
         jA77dBk71ktYSr+tA+mPbzregLfBgyhuAU5uraGeLZS4d3t/fJNBCulSvsIlPKq2uJTV
         GITuJTKZmk3K9RzCmdu4jNU5/XIKhiITOD1hhVI5TzgXixcSd3eIP8GZ24tPnaA4vQpZ
         HBr/cucYQ2GingjfFTl0EffvH0qwEyfzMw9U8O0u8OQHp0PqeuWubcxtu1lnjKEUmTPY
         5JqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883570; x=1785488370;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yBFFefkQzk4oWE6fof8dHzL8U/iTmHqazJ6MZ35iP1Y=;
        b=mDzAycO33W3lULaQ53+9eKNUqvqxAiaqvL4sx20Wjfq0PcyWuqXI38WYms5iEKio5j
         LXSiZ6jUXjmjR2ene8vsPF+JI1jlkAPcJpsbo/zL+iAvdMRXnbwc1ZqVz9lbQAF69vvo
         YfPrYs9Ex0uzzprMhFpSecuE4/ThykePzV/LJAVZO8MxTGSQ0tZLmg+hiytPBhuPjcEV
         +MAWEzzCzcKW/bxo0qrZxp8VY/e5fBQhEH8uHaCGiEWtCC1iQKc4SieSKSFDOGOXLqda
         0tFzgxy6jsH2TIMd2Kn3CzoIZNsDkBTUXcDe6Wbv5Y2XXtk7q3D+lBRnRvAxloGvPAg9
         LBYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKcg0sKPBrcgRR2CxlTq4M7MfkgtsTcZEmlQoz1CIKglv/Zw4vBE03A3pHRsIoMmRel5i27tWYgs614UDhTW4k@vger.kernel.org
X-Gm-Message-State: AOJu0YzHQJgDgvi2UAJNLmYaqj1cPVH6I5gFywU/VI4tWS0quV+FH8mO
	n1UA9/mT+kVmZBcTD0GCnwL1wK1wiP2m6tKixNLI9Zc2lYAu3hYhYCHGx6bqkVHu0XmB/U0obGq
	Rbp5IS0kg9EOQNbfCLFcZ/9Oi8YSomzY=
X-Gm-Gg: AR+sD10wu42KNdyNBS/kkt7wbC0y3bHddYcRcXCGyy8rdsltjjlWbasUiCR+6DhuvHb
	JtV8xtncMIFS/XucSiWI4yBiQImZoEUnlzTeITK8eEXw06f4FHKyKbMtcMcPKYOGDVxtt3JXC0h
	D9Y6Hwx3nZIeRzN2aeYH6eZEN0DjA7IS7owrnfiTqtw8uz7PDmBuuCoBTOi43wT9SYsjs7nFUCb
	bjtonDV181aENvchJXMDlvUnj2faIjqqKsgtlocAJ5AXdP4aBaTdZgB+Ck7MiPFMzl3R1ntm1Vh
	bdA2djeLjSLTdIOGyEU=
X-Received: by 2002:a05:690e:4848:b0:668:8286:1123 with SMTP id
 956f58d0204a3-668a4d376fdmr1211188d50.52.1784883569840; Fri, 24 Jul 2026
 01:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAD3nBebR3GPbufLyc95QVwueLBUWmGpxQhqtSt3EBEswjpdVw@mail.gmail.com>
In-Reply-To: <CAAD3nBebR3GPbufLyc95QVwueLBUWmGpxQhqtSt3EBEswjpdVw@mail.gmail.com>
From: =?UTF-8?B?TGFqb3Now6F6aSBMw6FzemzDsyBHZXJnZWx5?= <lajoshazilg@gmail.com>
Date: Fri, 24 Jul 2026 10:59:18 +0200
X-Gm-Features: AUfX_myQsFbT77i-3TP8O2QrZHFYC8L9lGbg0LRBoYydg3TLEX4FTtVxn1aM6rs
Message-ID: <CAAD3nBcJjY2We7Y9DNVoHxMwe-ojCXP2X-gbXYNwPJh_aZR=hw@mail.gmail.com>
Subject: Re: SDM632 SLIMbus: ADSP framer never gets frame-sync under q6v5-pas
 (works under downstream pil-tz, identical firmware) - what physical
 precondition is PAS missing?
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, spasswolf@web.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Srinivas, all,

With the help of Claude Code it has been solved, playback works in the head=
set.
Fixable in the kernel - no TZ/PIL-internal change. The last difference
wasn't a PHY-pad or
 xPU precondition, it's a single AP-writable bit in the ADSP CSR:

  QDSP6SS 0x0c20002c, bit 3 (c200000.remoteproc aperture)
    downstream PIL leaves it clear (0x103); mainline PAS leaves it set (0x1=
0b)

With bit3 set the framer never gets frame-sync (the INTF_STAT +0x604 =3D 0
loop I quoted); clear it and +0x604 reads 0x3e04, NGD capability completes,
the WCD9335 gets a logical address.

Timing subtlety that hid it: right after pas_auth_and_reset the bit already
reads clear, so clearing it there is a no-op - the ADSP re-sets it during
its own init. The clear has to land in the NGD path just before the
capability exchange. I do it in qcom_slim_ngd_power_up() before NGD_INT_EN,
gated by a DT property carrying the register address.

Verified on msm8953-mainline, 6.13 through 7.0.9, Fairphone 3: codec
enumerates, ALSA card comes up, and playback now reaches the headphone/
earpiece output (clean audio). A first-attempt capability timeout remains
(ADSP needs ~3 s; the existing NGD retry recovers it).

Two things I'd value your steer on before a series:

(1) Where should the register address live - per-board DT property on the
    NGD node (what I have), a soc-data quirk keyed off compatible, or the
    remoteproc side? This should help the whole SDM632/msm8953 + WCD9335
    family.
(2) Do you know what bit3 actually gates? A proper name/comment would turn
    it from a magic poke into a described fix - it behaves like something
    PIL ungates for the framer that PAS leaves gated.

WIP branch (personal fork, not for upstream as-is): github.com/llg179/linux=
,
branch fp3-709.

Thanks - and to Bert Karwatzki, whose working FP3 config was my reference.

Best regards,
L=C3=A1szl=C3=B3


Lajosh=C3=A1zi L=C3=A1szl=C3=B3 Gergely <lajoshazilg@gmail.com> ezt =C3=ADr=
ta (id=C5=91pont:
2026. j=C3=BAl. 20., H, 2:16):
>
> Hi Srinivas, all,
>
> On the Fairphone 3 (SDM632/msm8953, WCD9326 codec) mainline SLIMbus audio
> is silent: the NGD reports "capability exchange timed-out STATUS=3D0x40c
> CFG=3D0x0 INT_STAT=3D0x0" and the codec never gets a logical address. Sam=
e
> hardware works on the downstream 4.9 stack (A/B slots, same phone). With =
Claude
> code I've localized it to one register-level difference and I'm stuck
> on the last step.
>
> The only variable is the ADSP boot method: downstream subsys-pil-tz vs
> mainline qcom_q6v5_pas. adsp.mbn and its devcfg are byte-identical; the
> AP-side QMI sequence is byte-identical and ACKed in both cases; current
> mainline HEAD (including the merged qcom-ngd-ctrl fix series) reproduces
> it, cold-boot retested.
>
> Reading the SLIMbus block (0x0c140000) and LPASS-CC (0x0c000000) via
> /dev/mem on both slots:
>
>   reg (0x0c140000 +off)      downstream/PIL   mainline/PAS
>   FRM_CFG   +0x400            0x000D0C83       0x000D0C83   identical
>   INTF_CFG  +0x600            0x00000001       0x00000001   identical
>   FRM_STAT  +0x404            0x060D1901       0x00000000
>   INTF_STAT +0x604            0x00003E04       0x00000000
>
> LPASS-CC is byte-identical over the whole aperture (SLIMbus root RCGR
> CFG=3D0x509, branch CLK_OFF=3D0 on both -- the 24.576 MHz root clock runs=
 on
> the dead side too). So the framer is configured and clocked identically;
> only the status registers read 0 under PAS: INTF_STAT bits FS/SFS/MS
> (frame/super-frame/master sync) never set -- the interface never acquires
> sync on the physical bus. The stock firmware's own bring-up confirms it
> waits on hardware: it polls the FS bit, times out ("Hardware failed to
> enumerate ... (FS:0)(SFS:0)(MS:0)"), and its subsequent HW reset succeeds=
,
> so ADSP register access is fine. The firmware maps no separate PHY/analog
> block. On msm8953 I find no AP-side lever either: no lpasscc, nothing
> SLIMbus in gcc, no LPASS GDSC (unlike msm8996, which frames the same code=
c
> family under PAS).
>
> Two questions:
>
> (1) What physical precondition (rail / reset-deassert / pad / LPASS-inter=
nal
> enable) must hold for the SLIMbus interface to acquire frame-sync on
> SDM632, and where does the pil-tz path establish it that q6v5_pas does no=
t?
>
> (2) Is that step AP-reachable from mainline (SCM call, reset, regulator
> vote, clock, DT), or only TZ/PIL-internal -- i.e. is this fixable with a
> kernel patch at all, or does it need a vendor-side change?
>
> Full write-up, two-sided register dumps, binary diffs and the annotated
> firmware disassembly: https://github.com/msm8953-mainline/linux/issues/25=
5
>
> Thanks for any pointer,
> L=C3=A1szl=C3=B3
