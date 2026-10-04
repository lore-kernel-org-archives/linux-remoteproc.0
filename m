Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506913ADB89
	for <linux-remoteproc@vger.kernel.org>; Sun,  4 Oct 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791127600; cv=none; b=QDTxMeC2kNZDyuDYLO/EDj8sYUWhlvRby5HsNr2Si5RSPEewzD4NDM0Z3aHd7rWivWEbF5Srtgsibb8VVH3HNaGofxwmhJ4KI5rHSke+l7I99n3nG1RFn/aml504Z1gV/eFAY3KyD5pMHk1HYk1yWBi4UdWDOZ3VLc19M3uNh4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791127600; c=relaxed/simple;
	bh=2ch5mNrtmdxQSOSuWG7L73peId4LUbCNr87Fa7anJjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOIVv7edQNEgV440TlRQTZrv+x7OEc1St+uAuqd2WAiFgs1ByTQX5WJTpGl1u3Pk/CaBU3i+0X7Sx5S5DuYZ3unkPW/QmXsyLilZbKNdt3uDbfXuIaxhs0VQyoyE9pa4RXSFwys3NhxQGMH7LpQJUNBBhozFQ1kTRhfcevkDjp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9J14xJJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEw3Qlq0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9J14xJJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEw3Qlq0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694Ee2J32444957
	for <linux-remoteproc@vger.kernel.org>; Sun, 4 Oct 2026 15:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=At3ebrOXbtof0F5P/wwaDdSx
	0o6qxJSpe5weBws8clA=; b=n9J14xJJN1lWY7nq48Qr6iqgFLhmCX0YPV32RQii
	eWSplHy/WAEVZLxezJ5V5sIob28dYHxEyb9EHDSzB/fmXetCV6wRc68ROQkqDVo1
	md6g7n8mvu+/GyfN2iz52C0o7IiuWYCXWJJEoAbLRyhHZlj1qyXFr+KxTsvoPOM6
	Nei2sgYnKkVolyOapJKnya6W9uLEus9iCq6rfTHh4iAXXKwvXC2Zj37cNHALWh48
	eYMnOwtCPSPxRfdhngAdaNyKSfs4A0I4Qtd3kBvNfUlXH1fXnKbej2+aQGpo5YRH
	kI/lS0e+AhsZTgX52U3jhOsNdk/XAxhXJMenL8nM1lnanw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfh65w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 04 Oct 2026 15:26:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-313d1015161so3161710eec.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 04 Oct 2026 08:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791127597; x=1791732397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=At3ebrOXbtof0F5P/wwaDdSx0o6qxJSpe5weBws8clA=;
        b=dEw3Qlq0CQ26qdBAdLnCKo/E9X9JSzrt3DMfMJAeUu0n6+OPYR73L2jtlAVQWLbqka
         dUPO9UJMkLSqhpnLkscoJWWDZ/i82h8QHdfIi5aINaCaIztMTf8i2ZO9+wzv3wZN1hlA
         D2n8Edsi89vrqhPwc/B5O7XK2SwSsqK1F+ZauIOyoUQaCbTgqjixdoBJ8YOvLQgYEeaH
         v0eixO2dDdzMTBkeQP0Q5k8MCXcY5DNE4cL2cb74ypsT6UXDRXO6kJ5wVY9WJhXRIzEi
         P0Hq2dz/D5dqk39F2d3hQZz0XFFhdJkleBFTA8vBGqKw0gtjgYMdAt7Zb6N0WaMBQ87e
         0cIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791127597; x=1791732397;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=At3ebrOXbtof0F5P/wwaDdSx0o6qxJSpe5weBws8clA=;
        b=cG8twUOIcGu8Xg+vd3z5pux/4SSWe6pOZL2ePNNZ4xEgF0/sDRBwcN5Va5YxgNCMv4
         bocjdINaRTEziY5Mm2HfatXjpEy+CddnUaykOc/KteWjD+42QxxNVpDA5OhUdO2crJOd
         ocC20nidFdnKnrc/gjHbjk9z0zt7h2ycZp507dwlBKTzjRIjnJDugof84R2gIE13bNd5
         pvBzfdlpAI1FmHPJkn4U3eRcsUJeFwrUr9Jj4zQGUVL22110NVnSONO+g2jYDJG3Qmsd
         rEOaXyfG07fE5e60TS2c7vlQDQ8sCIbXe9qW+QcXD4Jf23NMRdyNVUnldSO/avLwvOkI
         8Eow==
X-Forwarded-Encrypted: i=1; AKwUvBxJ3a4U27d4T1JJrISB5pKvIUEj12wqS+4WB8WSmpvQTKd5rqvX9Zf4BOI9Y/DtTnwsl2yngf1ykWadE4SdQJzr@vger.kernel.org
X-Gm-Message-State: AFq9FYK/MB6wv4xh8lI8OFUlVfvLiI0hfsPbuvlhBQ7ss4yxKyfK+/2l
	GQTNq92qG6Sg8OhxoHjrvDCBD6f713QblTbmKmzMew4mreunmmW5gFvzNQPOpqZKzyYQpNZEoCe
	eiqA56zKpv+IjEMFSgOn2egiuqcIB4RCkiFjl9xB6xD1PkFOBPu/qmE3HElxRLvLbuKeEPH4V
X-Gm-Gg: AYBFou3DgEpsMAKWIlfBeLsiheHpK+Drd7KlVD7AkasV+dvwT2M6mD0XBxbnCBfZzGO
	UWiety/OYKUPf9mPlL9Y11tNhi1ZXNbqaevnV3r97kDEJ2nlV9FycBkzKhu2QPnH9OFCa7yGMt0
	c9eGYm79nDxNGxsjb0SY7uuM2OdrA9vjN3YrPuAi0ldiTO6sHSJTwDgwpYCwI5J8kzE17MFHhWx
	DFHFpnx1wbyWQtYzm9tmyPe049nhT7+YucXk/U6H13wKTayF9MTiZejMWG6rnGuRbi+/AQ2D49r
	PFEMiFnLF4PLNtKGP/l+pfW6daiEaEx+MwNLWJnQqr3F8vP2EulWoiqjoI6m/jWwERQTN5Ynva1
	xMlQSBFFcRosp/eZSG8nx/jC8MkgHKtIUJGgkJC9PfA==
X-Received: by 2002:a05:693c:88dc:20b0:351:985:e729 with SMTP id 5a478bee46e88-35109953237mr8368018eec.12.1791127597001;
        Sun, 04 Oct 2026 08:26:37 -0700 (PDT)
X-Received: by 2002:a05:693c:88dc:20b0:351:985:e729 with SMTP id 5a478bee46e88-35109953237mr8367993eec.12.1791127596447;
        Sun, 04 Oct 2026 08:26:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512713c9a6sm5600553eec.5.2026.10.04.08.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:26:35 -0700 (PDT)
Date: Sun, 4 Oct 2026 23:26:31 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Drop early_boot flag for Nord
 ADSP
Message-ID: <asJwJ6cq8FcA0IID@QCOM-aGQu4IUr3Y>
References: <20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com>
 <58c1c4a9-afad-4059-ba81-cdcc92d0c5dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58c1c4a9-afad-4059-ba81-cdcc92d0c5dd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wEnwjC-TmAer3rQKgvcjgJIAkRMO4x5t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA2MSBTYWx0ZWRfXw4JB2bjiXv6/
 rbUiTRT5Pu6bWkpM+1r7LM4YPdiuMTki8u6bRi35uYtVH7frPO6vRwaGP2MUC6kuwcXa9wNVcST
 x28GaazN6jobMlUo1yRPJYmMBiisTsE=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac2702e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=NTnRRJcS9uFvT1zYgXQA:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wEnwjC-TmAer3rQKgvcjgJIAkRMO4x5t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA2MSBTYWx0ZWRfX3oDP1UDOMcEy
 XdOswTnLy8qVWTcimusTrAQ3BKonOZWZujGKZK6Erje25E+A4P0ewbZqTwCo5ScwJ5pkjwUPvR0
 iao/jnqcqLSka4cOeSpadIZAOz1C2R+v05O84rJUZv3Wmp0lXbL4TZ1m8Mgu4gzJLbXLVFcSWzk
 UihIrliBeKsfWju8VxglCwQCioF2mtFrSEn94TCkxL3ELtn77GIdMsyvyMA+Uv4haVIixPjNT+0
 4mHc4B0rJcpehb39O/XNIXdKLh6tBnNzPauC0uAymilygy78E5FZIMc7uExl3i047P7a7BqWHfm
 Z5IJIhJqOc3Yu3qzg1yzR8Hae06yQ4AK2EIpe/Vg34P4jzE+7d2Y0TwTPG9ZHEF8Q5BsBeM2bS7
 qB59D9OoYyh0er/jiTQZaSModKOtx76QyXTNGh31OV8CWjvUclauJR8o6oru+MCFKv4iw1mn+rH
 8E9bTaU7KuJTRGObNrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610040061

On Thu, Oct 01, 2026 at 10:42:39AM +0200, Konrad Dybcio wrote:
> On 9/30/26 4:07 AM, Shawn Guo wrote:
> > Qualcomm NHLOS team changes XBL for Nord IOT/Embedded variant, leaving
> > ADSP to be powered up by Linux remoteproc, so that Nord IQ10 Qualcomm
> > Linux (QLI) behavior gets aligned with IQ8/9. Drop early_boot flag from
> > Nord ADSP for that purpose.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> What happens if this patch is absent?

ADSP never comes up:

  remoteproc remoteproc0: attaching to adsp
  remoteproc remoteproc0: can't attach to rproc adsp: -19

Since XBL no longer boots ADSP, the remote never publishes its SMP2P
inbound item. The smp2p entry stays unmapped, and irq_get_irqchip_state()
on fatal_irq returns -ENODEV. qcom_pas_attach() treats that as a hard
error rather than falling back to a firmware boot.

Even the existing fallback (ready bit clear -> RPROC_OFFLINE) doesn't
work: rproc_boot() takes the attach branch, sees the error and returns
without loading firmware.

> 
> When the early_boot path was first introduced I was really hoping
> that this behavior could be made unconditional and Linux would
> figure out if the rproc may be active by virtue of it sending
> back signals or not, unfortunately that hasn't made it into the
> tree..

The difficulty is with the positive signal. As Stephan pointed out [1],
the ready bit is not cleared when the remote is stopped or force-shutdown,
so a stop followed by rmmod/modprobe of qcom_q6v5_pas makes the driver
attach to a remote that is not running. Without ping-pong or a PAS query
for the remote state, I don't think we can reliably say that a remote
*is* running.

The negative signal is reliable though. The -ENODEV from
irq_get_irqchip_state() means the remote has never populated its SMP2P
entry since cold boot, so it cannot be running. We can fall back to a
firmware boot in that case. early_boot then becomes a hint that the
bootloader *may* have started the remote, which matches Nord ADSP:
it is started by XBL on the Auto variant and by Linux remoteproc on
the IoT variant.

I'll drop this patch and send two patches instead:

- remoteproc: core: continue to the firmware boot path when .attach()
  leaves the rproc in RPROC_OFFLINE
- remoteproc: qcom: pas: treat -ENODEV from the SMP2P state read as
  "not running" and fall back to start

With those, Nord ADSP keeps early_boot and I've tested it with both XBL
variants. With the old XBL it attaches as before; with the new one
it falls back to loading firmware.

Shawn

[1] https://lore.kernel.org/all/ahBG6jKYdSAboWjs@linaro.org/
