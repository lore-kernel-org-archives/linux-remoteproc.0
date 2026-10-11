Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA74123EAAF
	for <linux-remoteproc@vger.kernel.org>; Sun, 11 Oct 2026 02:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791684280; cv=none; b=eaIwLth4W6VhoTb3LH60HNC4nauutL47AZlsnzLlxQPqCDDZJrrrbqPRrU7gIf8uqDTQZzn14UkLMkOH62pN/4wxINX5x+GR4lw3u3XQT/EcLBoqU79/qHViAvmrETXWibqoKpRVVk2DHcVmqMUurYUFQCDnmuZQDwYTwkYbEls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791684280; c=relaxed/simple;
	bh=sKn/nrmLPM5n+vpbEyLe8dLcl1zlOtOCc1FbfDDrLqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLFwp9muTyA59SWyhRvsdJeDuiOfI024rRBfKOmpuNjsB4TQ/hYQIfDXvdAxjz0RiJn8znkJH27HfXtpX2IbHFHQUcjUtswKHxAs4B5mEDb2FvPEArVYDjHlPwrmJjzuwZBWQCPmDbK7xR3CBCDQW3G3fY0ioTMUSxyuY1ayIqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTHvhlF3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MqXo7TpG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTHvhlF3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MqXo7TpG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B1paBB765578
	for <linux-remoteproc@vger.kernel.org>; Sun, 11 Oct 2026 02:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fuBDltk+gj/ojNJZ0u0bn5L8
	8uJRD6e8V97djMMcdt8=; b=WTHvhlF37MzGu5NZhQwSb2wncZYhhZYB+HaAZfgl
	cL34Ly859iO+3Buqd4Wz0mHUxgEwl4ffAVU7G0hnGhIGJFenlP3pxhykSvoWwX4I
	WhCC/+xCG80agvMO5fZHX5kLolGPpQvbuuVqvGKNaFKCw5ntxNzGahjFGnko8Jhc
	U1VVCW6pT2dnZsS4hxXNfdmzRkSSln1EXtqZV9X3UZ57CoScqd1qwmM0gFHa+UQy
	Q9m/1LqrHBfrj9AAx93nbFDkjqg666oiTJlX+Sa7XL/HurDoQDGuIwKOb+gT0WN6
	icsktvEt8rTfua6qCEhHKvWsg3/f7zNSJo3UQdArfzxTFg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjj1uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 11 Oct 2026 02:04:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so221095eec.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 10 Oct 2026 19:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791684276; x=1792289076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fuBDltk+gj/ojNJZ0u0bn5L88uJRD6e8V97djMMcdt8=;
        b=MqXo7TpG/ESjQWKt8yGvHLh0uHDm12lYuQo6UtXsAtiV4VjzqV2v1lH1Afdke/u/Vz
         lblOTPiYAbWaMaVUwylj80RWP4TV/RPpPAy6Kiha22ADwJb9TSe1wWE669Oaqx3hKNdw
         7JbMq50wLRqEDzr+XAYdz1bdBtTfyU6AApuGQx/IXsQq5UqPQSDlfswNFczA9TbFiFQK
         b54Ud+zbVCgMYyewWd9N9yCD73qkOZEl0/HuR4Bi3ccjvrckQvzqOgPfnZHrDQ0+WzrT
         zLIvzgrtlZlmVODQfaFeCCrM877VXTFf6VGrvV0BMyRHjg8+VLDl1CgcNAt1m54kNgcg
         lRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791684276; x=1792289076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuBDltk+gj/ojNJZ0u0bn5L88uJRD6e8V97djMMcdt8=;
        b=Wn8c45skPahbQUtsYlKgVBW62EJxpbmnfyNKwhSvTnlKns2HtRZ4A9vg1P+yn2soob
         jkw4F2c2ckR3uQXfTnpEJnP5ZhcgZyfv42VkurukPJsUWNeJPzjwrUPRmAlW6H3DV5Yi
         aZ3GQk8+ExvTTqNGblHMqh36wPDTaUgMLXKiUN5Y0lzCD9eu0ZCpz/ZnkbIsRN1Tqi1X
         eNL7GVvbJ4Gx9U8uwKpfMBetkKPAcNN9k8LZNlif1oB+UTlvl+C+yUVaJknEPsQJggIi
         rkzlyBZ8uVSAAaZz7Qk/xi/AOWBY+MGKeublzW/kGAciTnG9Fd1mdQ3aJ/nxUahETicb
         4h0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxArUnFgUoAurbxUUnfMHDJGnXVZrN9d1t2fNeJfKuwYtccdw/xJsO8lk5SymFzRiEworu/Ho8JeUbi8rMYdPfs@vger.kernel.org
X-Gm-Message-State: AFq9FYJY/WhSUl91ulzfsrYJ8mYrM4CxWO5ib4fi5ltVHNOD+Rrujeqf
	rkupZJxLzOCXt/EK9my7d4T6/QCTZODbDx/vHBG2AvRsxgqw1K9UmV9DfHgmMHmne21J7VQ9V1w
	kcVa5fSSr5VGJxqjuTCyF4EE6V2Dn0x73uYvAMn7HUKK3fcsB4j4SGzUD0mHpDcZubXEF7R09
X-Gm-Gg: AYBFou1rtzBNhTzo1njxsF5e5HKjZVj0k8ky3iiuYYRBa+u06aGSN/tx43ImpTvIK3h
	0Ui/joNfIKqlzGamTOh2EfPepTrO6RiG+VygaXXNtwEQyAZMZ/qm5xIXdkTKnqd5wTvOTROfv3a
	3W6mftazgJ6VrKoZWKX8RnLprOeove5q/5P83j00i022+a8ssbw93bT7jd+1l/Sz8VBsh2NIMQW
	v5YxiuzziAW8bMB7xGGy0wDhNtLGcZhRDr6nPyN6DGVpW7Z9wRAzJ33XvAJrXZmpKP3+iTGYBAR
	lQEm00b0XYBKIyCjrMMceVrUAjyddnWRwMB3IyUDP0ydhVam6B0KhN5ei0bILjUH4HjIT2JedQd
	e9UswxclaSeVvGjvAx99jHqODuolZZH5PsmIYrxc6wA==
X-Received: by 2002:a05:7022:1605:b0:151:94a6:6f5f with SMTP id a92af1059eb24-16a5fc917b4mr9179278c88.10.1791684275941;
        Sat, 10 Oct 2026 19:04:35 -0700 (PDT)
X-Received: by 2002:a05:7022:1605:b0:151:94a6:6f5f with SMTP id a92af1059eb24-16a5fc917b4mr9179254c88.10.1791684275265;
        Sat, 10 Oct 2026 19:04:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca0e64csm20491794eec.10.2026.10.10.19.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:04:34 -0700 (PDT)
Date: Sun, 11 Oct 2026 10:04:30 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Don't fail attach if the
 remote has crashed
Message-ID: <asrurrjg3TbOHnWf@QCOM-aGQu4IUr3Y>
References: <20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com>
 <20261006033550.2726451-3-shengchao.guo@oss.qualcomm.com>
 <asj8VnSmKBF3nA79@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asj8VnSmKBF3nA79@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAwOCBTYWx0ZWRfXwxfVhCDVCJWu
 oe6u2bXeGq9few15FwooSfucgS++xhRDEr5Z3ZB4LMbkBiYfMuTga023O9xS5Cam1nBeyvYMysP
 +CrGAIhr9p8pjxdqC0ARSFeuBWILzotyH0YsU2OixJOggDezc/Jc/sCmUcUmiXkMExC6gB5hq0f
 oDRS/umUVVrnBy2oYU104wfivaNNaZvqbXFqtkW1JCsQHWCpusVsGEc2soZ/4MT9b1xw4hUkWpt
 YpPx0YdlO4Rv73RAqsRh4FwkOSM5pHQlYaaBf5wjqgriM+DgGEf81xsE4pp8C5seKqgL1CFVESM
 cpoi0aZZBdQmGvtHlZ23P66zsWT7iEansCRhL9NPQ8Jss6kiQokiIEkKVDRZBXj6eZ4Ah4BreQK
 XEqBXIknIW60ZeXS3CywFJSAUaEWC/1Dqq7gVUT9MZB5scpgC5l1dXArgReJQuN6B9BGo2EHrnz
 FRsfRTc6eY1Yekge3FQ==
X-Proofpoint-ORIG-GUID: Iqv3PhuQ4FtTPXZLf5Z2lydlJVZaJdzs
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acaeeb4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ReihM4LL204W2qN9rysA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Iqv3PhuQ4FtTPXZLf5Z2lydlJVZaJdzs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAwOCBTYWx0ZWRfX69xcE7hwp9TO
 CsanKCaXUw2+PQwyqrn1tyAZ02R8WtaJM2xKgzDSsyuz5DQ3kkEKiXMMyP0mP2mSkPHX9PXOI0M
 3qbzGhiWfT9QyzUtV5LdMWt5abwFjZE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610110008

On Fri, Oct 09, 2026 at 04:38:14PM +0200, Stephan Gerhold wrote:
> On Tue, Oct 06, 2026 at 11:35:50AM +0800, Shawn Guo wrote:
> > When qcom_pas_attach() finds the fatal SMP2P bit already set, it reports
> > a crash and then fails the attach. The core unwinds the attach while the
> > crash work is queued: rproc_boot() drops the power refcount back to 0,
> > and __rproc_attach()/rproc_attach() unprepare the subdevices, clean up
> > the resource table and disable the IOMMU. Once rproc_boot() releases
> > rproc->lock, the crash handler finds the rproc still RPROC_DETACHED,
> > marks it RPROC_CRASHED and runs rproc_boot_recovery() on top of that
> > torn-down state:
> > 
> >  - the subdevices are unprepared a second time by rproc_stop(), so SSR
> >    and sysmon notifiers see a duplicate shutdown;
> >  - qcom_pas_stop() and the subsequent rproc_start() operate on resources
> >    that rproc_attach() already released, e.g. iommu_unmap() on a
> >    disabled domain for rproc->has_iommu;
> >  - recovery leaves the rproc RPROC_RUNNING with power == 0. A later
> >    "stop" via sysfs takes power to -1 and returns success without
> >    stopping anything, so the remote stays running. A following "start"
> >    then boots the firmware again on the running remote and fails to
> >    re-add the still registered subdevices:
> > 
> >   sysfs: cannot create duplicate filename '.../qcom_common.pd-mapper.0'
> >   remoteproc remoteproc0: failed to prepare subdevices for adsp: -17
> >   remoteproc remoteproc0: Boot failed: -17
> > 
> > A crash found at attach time is no different from one reported by the
> > fatal interrupt right after attaching. Treat it the same way as
> > q6v5_fatal_interrupt() does: clear q6v5.running, report the crash and
> > let the attach succeed. The core completes the attach with balanced
> > bookkeeping, and the crash handler then recovers the subsystem through
> > the regular RPROC_ATTACHED -> RPROC_CRASHED path.  With running cleared,
> > qcom_q6v5_request_stop() does not wait for a stop ack the dead remote
> > cannot send, and handover_issued already prevents a spurious handover
> > on stop.
> > 
> 
> Hmmmm okay, I have never thought of this option, but reusing the
> existing crash path as-is by making the attach succeed feels actually
> quite clever! I suppose starting all the subdevs is really redundant in
> this case, but the crash case is also nothing worth optimizing for.
> 
> > Assisted-by: LLM
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index 8f3d45c604c9..0ecd7688a54d 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -562,10 +562,14 @@ static int qcom_pas_attach(struct rproc *rproc)
> >  		goto disable_running;
> >  
> >  	if (crash_state) {
> > +		/*
> > +		 * Complete the attach and let the crash handler recover the
> > +		 * subsystem from the attached state, as for a crash reported
> > +		 * by the fatal interrupt.
> > +		 */
> >  		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> > +		pas->q6v5.running = false;
> >  		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> > -		ret = -EINVAL;
> > -		goto disable_running;
> >  	}
> 
> My only nitpick is that it would be nice to fully reuse the normal crash
> handling in this case, in particular the crash_reason logging inside
> q6v5_fatal_interrupt(). Can you extract that part into a common function
> and call it from here?

That's a sensible suggestion. Will update.

> (I guess you could also call the existing q6v5_fatal_interrupt()
> function since it should work as-is, but externally calling an interrupt
> handler might be a bit weird...)

I share the same view.

Shawn
