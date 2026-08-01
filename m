Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AF6394EB7
	for <linux-remoteproc@vger.kernel.org>; Sat,  1 Aug 2026 01:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785546010; cv=none; b=q3KtVQHNV0N12+rPkQ0RkXXFj00Z5ygdxl93mm2gT5rwCT5d1vcPXaewHuX8aL03RBNocNyX5LX1XCOFY1AxUBXfjI09vkFxQ9vTqx9uJR1iNpVYW2pohzMTlVyTLsdQA0n8puyJbg2s/ETQmymcYRshenvS/mJNHpT3KUW6vTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785546010; c=relaxed/simple;
	bh=k7IIENyVvsEfARfIatk9sz0DfXh6dweeMavMLiwzvtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mz/HA9M2mi18YeBxy+dSjNQSrKXHDP4cBTl8dDaKjV0TS68Q1PPpZpEV8/wWUtL3hLASzFpTN6xAWWZW4zqt3cdrYdalbgrBr78YfOmu0UMCtRJyHtnKD2X/rZRIP5LtJUu45YcU+oMW5KnnycNTaYdvLLVP1nJCPpyRNNkkf1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eU3y+TKy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Krrofmlt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eU3y+TKy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Krrofmlt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VM0d9g909834
	for <linux-remoteproc@vger.kernel.org>; Sat, 1 Aug 2026 01:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c42abJTL5cQsi9p9dq0hFd/N
	52pXVYMvGI8d2QNfMHM=; b=eU3y+TKy1B80IuuIFMTxt61+5vy63AIK/wMVwoSI
	qCxYhcxp1GQAzKJum3nL4UV8MIvCmkhjgILavFIdqMivhmFQGadt+PU46M71fkv4
	XmdIUS77XrjnJ/nZjI7bQ0iPn2nNvGJTeVJkSCyVNkWJGJKKOm2AKU+4RIIcswYJ
	hHLJhViUmafKPaO1RhKhi0LMhhAROuVXjzmOofTL/Uc++Br0M9a6NKJ4w6OYJuN4
	Uu8iuZXEmRbt2jftsUFrv07Emslw0cyxepjpo2MuEgyzWkB9ltw2vdsoB68wbTjV
	bS9prd+g6eF9Sljr9nQGEPtLMRje4wmQ3HGT/Uv8rohSnw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frugh2y9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 01 Aug 2026 01:00:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6823efcso12790405ad.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 18:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785546007; x=1786150807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c42abJTL5cQsi9p9dq0hFd/N52pXVYMvGI8d2QNfMHM=;
        b=KrrofmltAmmxktHoUJ3NLYl/79vLtyfOi5Rhbm7rZUdTRsaXJGFR97SIFE7cvwuQ1d
         8CcVdtTXqMSHJo15FtYC6ifUIw/r7vmyVimQDfl92Mig8geiHqgvcOIbKmdSu+v/sSsf
         EmzJhObEosXGJPWQctJzcjsWaV2mqQluRoz2y4JjJuyEZ0Rp1Us9aUxCZR0VOXUuZLQr
         H6F7Cg07DwIYGyh1LaJbRYXdHEWChZK2cGBKgnvACzREvfgnQWST1Pgr7qJu1Qc2KxnL
         k6WW4vg91wuEJoBr65b1gvIArbyaFnm3mCTSoxupJU9H0A1Ix9JfWUj5p+SNqGHA9bZz
         iP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785546007; x=1786150807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c42abJTL5cQsi9p9dq0hFd/N52pXVYMvGI8d2QNfMHM=;
        b=NID9N47YnH6oCveg8mehD4+drO6QYpqU4br2AsMt9QO6YvOz2Blsr/R3qZcH60stSk
         FY1uucGYDovnBKIAjD0+O9DNrJYX5fxLMx+wLB1EJkBtZyUv8cn9PcEbKLhKAUd9noMv
         81FtXJUtZ+UlqVMRRwRj5SooC8b+7xpoSmkv8ZlelJBOb8wCydDCZpO0+BvyenrKa8VD
         mkKT9Xbhx6IRwCwNqIRhi6Sk8x1W2ojHx3TpQ0lv0bJYCNNpz4aPDgPvNGpS0jfbAkbH
         /S5RTYu9WSbU+qbaN2o9qpZRcvui3eRoKPQTfH+4MHVW15013iHmEynTfHXdNSPSFFT6
         Vm2A==
X-Forwarded-Encrypted: i=1; AHgh+RpjZ+Kx8G0LJf6WWRcWr12vV5TYahjKbsr5GXbIo2GG3Q8heiCWH65xXvpoJKKLoRRk0Q8Ode/vKkp7/gavfWv4@vger.kernel.org
X-Gm-Message-State: AOJu0YysO+V4dKwAxkV31VswUgFNibE2w+OtM8ziFen4Uu/yK5YICwfP
	JmqfX0DY9KC56A8BPHR80BpHsi+5VlGcQWSmGJe6gNqaJ2qsMh6Vf8VZMlIXEp4jquLD0stJ5R0
	TGhZ3Jzg9CDl6Hb8mkuO4R/bQ8HfBeCu2cZik1g/ffoV/NzaOnjR5qxTKuN9MsAo7iwxKIrkxXf
	UKFCO86cI=
X-Gm-Gg: AR+sD12RALmKLS73xLLKvsXLhUEcqNW+nK6jTQiUpRPvak5cTxrNkOWgZlm7bIgTMyv
	wxbk6UG9B1YzmjI7Z3w4KkwkxflupRICbh2AiRMzcw2yHSqdGy947ZSAFKfz4yb9FgHUTx2p2VC
	I1dG1wirrQTCCAW6kHvA2CIe3uKDG8BftzHMYTsYrASBAo98opAOGG1C65pSwzxWsOxoWq8yPTl
	2HkJv8uS5ewlL1i9lfABNyL9B+g2yHyWZP6q/aH/vXmo1GfB3wMrmAy6g8GuRx4iJq7bZtRBcFh
	lk7xv7AGXT/C5nq5j6nVMyxExX38BapU4/X676rTcAUAC4lZ4NSL95p6YloXd7VuQVpJRhiHsni
	GFOV9RYyg1KJXcGi4e2MFuRhiUp9acabYKQ3H6DoP3PY=
X-Received: by 2002:a05:6a21:6f07:b0:3c3:93ce:663 with SMTP id adf61e73a8af0-3c92a5e1612mr1614627637.26.1785546007301;
        Fri, 31 Jul 2026 18:00:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f07:b0:3c3:93ce:663 with SMTP id adf61e73a8af0-3c92a5e1612mr1614605637.26.1785546006831;
        Fri, 31 Jul 2026 18:00:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm15804960eec.19.2026.07.31.18.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 18:00:06 -0700 (PDT)
Date: Sat, 1 Aug 2026 09:00:01 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: q6v5: Ignore stale handover IRQ
 delivered on attach
Message-ID: <am1FEXJkgoZ0yCiv@QCOM-aGQu4IUr3Y>
References: <20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com>
 <20260731025655.2642860-3-shengchao.guo@oss.qualcomm.com>
 <amxf7MODINj26a4m@linaro.org>
 <amyc3MTsuCBg82WH@QCOM-aGQu4IUr3Y>
 <amyhh8lNMT9rgK_X@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amyhh8lNMT9rgK_X@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAwNCBTYWx0ZWRfX3At5efwAsGpw
 AvjvazqTCbh6msvu2Xwob6QVkPVdhVur6HN6pxF1A0rB5THL3lLQsKc8F8+cWhPB57EpiEyLdiK
 0Mg1lcSye9wdJSO2YWwoROBPgDIR8vmOkGDow3ZAjBTJSE6xvC2jqe0qhJmioPY3oUfVAFWNETm
 wFgS0BpWl7+hoBguuW2wRh1HZxFykRm9GliasA9uLyTbFt0DP+tcY1jW/EFGn1jw6HowQuexwro
 11pN/emdWB46aJoI4seM41nY+YKwNapiTDkOXF2Do+gZp3rD9UuAc4GTJ6nKPBUOmHycrio4BU5
 mJ1Gf0UbDB8JlmAIz6KQLFO8Cijp/oYOYVTFi2oJenc4bkMGNuf1aGQmovC+SqGwhxgl4nBrcR/
 HAsBdtQlpWXqNlYIXMSBd9FOwPsaWIpburYg64Lnk9yArmtZsV5DHkqzJS/EztI1W8ZKmI0rO21
 aECUBLbce/D6BhnWPVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAwNCBTYWx0ZWRfX+3r/CB9zext1
 PaXW/ME+IvR30uM79tIN6EP81LmYY7hvW8iItTtsBTa+zqlwTXo+gM2q7cNBJuTvyWlDe++n5G8
 9K64qck1z70U0GQlEhHipR9OxuOWG90=
X-Authority-Analysis: v=2.4 cv=U+iiy+ru c=1 sm=1 tr=0 ts=6a6d4518 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CrmoIpH0fVBdSVDkB_AA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: vtsADcBh7Xw9pjRSGZZOrTk7K6Z6SkC1
X-Proofpoint-GUID: vtsADcBh7Xw9pjRSGZZOrTk7K6Z6SkC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010004

On Fri, Jul 31, 2026 at 03:22:15PM +0200, Stephan Gerhold wrote:
> On Fri, Jul 31, 2026 at 09:02:20PM +0800, Shawn Guo wrote:
> > On Fri, Jul 31, 2026 at 10:42:20AM +0200, Stephan Gerhold wrote:
> > > On Fri, Jul 31, 2026 at 10:56:54AM +0800, Shawn Guo wrote:
> > > > Commit bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
> > > > dropped the check that ignored a handover interrupt after handover
> > > > had already been issued, relying instead on disabling the IRQ after
> > > > its first delivery to make it one-shot.
> > > > 
> > > > That is not sufficient for qcom_pas_attach(): when attaching to a
> > > > remote processor that was already booted by the bootloader, handover
> > > > has already happened out-of-band, before this driver ever probed.
> > > > qcom_pas_attach() sets handover_issued = true and unmasks the
> > > > handover IRQ to keep the enable/disable tracking consistent, but the
> > > > transition that signals handover is latched at the interrupt
> > > > controller while masked, so unmasking still delivers that one IRQ.
> > > > 
> > > > Since this driver instance never ran qcom_pas_start() for that boot,
> > > > it never took the proxy power-domain/clock/regulator votes that
> > > > q6v5->handover() releases. Running the handover callback for this
> > > > stale, already-accounted-for signal disables those votes without a
> > > > matching enable, producing:
> > > > 
> > > >   genpd genpd:0:4c00000.remoteproc: Runtime PM usage count underflow!
> > > >   genpd genpd:1:4c00000.remoteproc: Runtime PM usage count underflow!
> > > > 
> > > > Restore the early-return when handover_issued is already set, so a
> > > > stale IRQ delivered on attach is dropped after being disabled instead
> > > > of re-running the handover callback.
> > > > 
> > > > Fixes: bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
> > > > Assisted-by: Claude:claude-sonnet-5
> > > > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > > > ---
> > > >  drivers/remoteproc/qcom_q6v5.c | 17 +++++++++++++++--
> > > >  1 file changed, 15 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> > > > index 10fa38f264c8..e715083846aa 100644
> > > > --- a/drivers/remoteproc/qcom_q6v5.c
> > > > +++ b/drivers/remoteproc/qcom_q6v5.c
> > > > @@ -210,10 +210,23 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
> > > >  {
> > > >  	struct qcom_q6v5 *q6v5 = data;
> > > >  
> > > > -	q6v5->handover_issued = true;
> > > > -
> > > >  	qcom_q6v5_handover_irq_disable(q6v5, false);
> > > >  
> > > > +	/*
> > > > +	 * When attaching to an already-running remote processor,
> > > > +	 * handover_issued is set before the IRQ is unmasked, since the
> > > > +	 * handover already happened out-of-band, before this driver probed.
> > > > +	 * The transition that signals it is latched at the interrupt
> > > > +	 * controller while masked, so unmasking still delivers this one
> > > > +	 * IRQ. Ignore it: this driver instance never enabled the resources
> > > > +	 * (proxy PDs, clocks, etc.) that the handover callback would tear
> > > > +	 * down.
> > > > +	 */
> > > > +	if (q6v5->handover_issued)
> > > > +		return IRQ_HANDLED;
> > > > +
> > > 
> > > The goal of Abel's patch was to have the handover interrupt unmasked
> > > only when needed. If you just bail out here and do nothing then there
> > > was no need to unmask it in the first place. Can you just drop enabling
> > > the handover IRQ in qcom_pas_attach()?
> > 
> > Hi Stephen,
> > 
> > Thanks for the comment!
> > 
> > Although it seems working in my limited testing, I'm not sure it's
> > entirely safe to drop the handover IRQ enable in qcom_pas_attach().
> > 
> > The handover IRQ is requested with IRQF_TRIGGER_RISING. When we attach
> > to a remote processor the bootloader already booted, that rising edge
> > happened while the IRQ was masked. Masking doesn't prevent the edge
> > from being latched at the interrupt controller -- it just defers
> > delivery. The pending bit sits there until the IRQ is unmasked and
> > actually taken; unmasking alone doesn't clear it.
> > 
> > If qcom_pas_attach() never unmasks the IRQ, that stale pending edge
> > doesn't go away -- it just waits for the next unmask, which is the
> > next real qcom_q6v5_prepare() (i.e. the next stop/start cycle). But by
> > then handover_issued has already been reset to false for that new
> > boot (qcom_q6v5_prepare() does this before re-enabling the IRQ), so
> > the stale edge would be indistinguishable from a genuine handover for
> > the new cycle. It could run q6v5->handover() and tear down proxy
> > PDs/clocks/interconnect immediately on prepare, before the firmware
> > for that cycle has even signaled ready.
> > 
> > So the enable_irq() in attach() isn't dead weight -- it's there to
> > deliberately unmask and flush that stale latched edge right away,
> > while handover_issued is still true from attach(), so the IRQ fires
> > once, gets caught by the one-shot ISR, is dropped harmlessly (because
> > handover_issued is already set), and the IRQ ends up masked again.
> > Removing the enable would just defer the spurious handover to a later
> > and more damaging point instead of eliminating it.
> > 
> > If you agree with the theory above, I can follow up with a comment
> > update in q6v5_handover_interrupt() to make this rationale explicit,
> > so it's clear that the attach-time enable exists to flush the latched
> > edge.
> > 
> 
> It's a fair point (that I also considered before writing my original
> comment), but I think it does not apply here.
> 
> There is no real interrupt controller for the SMP2P interrupts, all the
> handling happens in software inside drivers/soc/qcom/smp2p.c. The driver
> does not implement any latching. If the interrupt is masked, the bit in
> entry->irq_enabled is not set and qcom_smp2p_notify_in() simply skips
> signaling the event.

You are right! I will send v2 to just drop handover IRQ enable in
qcom_pas_attach().

Thank you for pushing on this, Stephen!

Shawn
