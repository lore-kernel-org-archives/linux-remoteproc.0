Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09101C3F0C
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 02:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773195110; cv=none; b=fTUtzye+GYEgcN1CdfeTt3pPXfe7HWYgiiiBKbDLy5w3h8GXlGb7TKg7nfezTjLnVLX/FnJgGSPRz+jsmpXCEetA3Sf0uct0eXhGByKtibKi7Ea96EYUH7C/mLRm4f/Swd5vFzmvXEj8kivFkJCI4WhFViJ25QwxaIC0ndqH/30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773195110; c=relaxed/simple;
	bh=PAz0+xYAabG60ZBoVLaRG0/g3Yg93cVP7UzyAkqITHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDAS1t7OYU0Di/1afg/J/88rK79Z2qylDSizuNPSlEfCi3ck29BDi6bXoya1Y18hgBNm5b2Q42sIpVQKLe7Q7ZVfBapkLt5vTLXytX0KI5doPqP989AkVq+fWT7pMjmdT36t6ZxeKCf/3Uxrbddjh+ig7vjsvRu4f9xlLG9WLjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQmk/Ui4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSwVVLIQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQmk/Ui4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QSwVVLIQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B0YEGj1266049
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 02:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m8u7bBysoOqVUoOw9C2g3MJP
	KKZHXPON57UnH5iAnhs=; b=gQmk/Ui4q2u4ikmRoBxVTycB7mqehrhsCH4K4Grn
	DYK9nrEXhoSoFLqptAP972TXNIqyOUjALFrZnqWoj3YBDHaQSWMPz1q3X7kvF+6M
	QcvJa/V5FDHxdkvS40Ev4OsdbN2XCKhQgW5PuuBBTYF8Tl8PTSoHdW2Rwt2WBe0/
	2aV9HmTqNa1vnekQ3jaMuzThBPesSwwmC5LXIsByiwiG4Yc10DSJ8Psyi6IrSuZP
	geCnfVn8meIf4VHk0YFB94GoGm4lTcOrJclcha5oJc64tfH076NPXMLLfTsdALug
	+kL0U1RvIKSbXEEffu5kmEQrGABYiIuOGH4JAwXpG+yf3A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctpkfhw9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 02:11:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-600061ca5edso24104739137.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 19:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773195106; x=1773799906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m8u7bBysoOqVUoOw9C2g3MJPKKZHXPON57UnH5iAnhs=;
        b=QSwVVLIQ7vux+7TZNzsq0XDlUB4x5cRatSEjZS9zBQw3hPsNIs71cSYni5GS9LydK2
         V0mQTaJvYJGWCQbWlA+6mtEEh97QEUsKK4w4QNyqghiawXWdjMk+BKxi9R17mMy4fieC
         L2vFMjzXQC0IKFuJuWd/3FJ0H+AwETa9qsoq63it6sfxJO31OnCa9PdQvS63N44ZaZHJ
         Q7sYGJab/y7txsZG0yA9PVuz+WTzMeYBzSpBqbuIjVWauHZO4WuXzVnA373m0We7k6hJ
         JJtDF9QqAl9BG7mCwP/PD8PgxuCU1OnqbP0BCaR2j68nA0j7hdL5p47DD4mCli3y3PQ7
         5gkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773195106; x=1773799906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8u7bBysoOqVUoOw9C2g3MJPKKZHXPON57UnH5iAnhs=;
        b=cZKniJOU7u7FgNRAtelk1qUttiK5oKCfn9kUiiApUb/m6a3XZKBxMqZ8/MTRJsjihO
         VyzsU1zXDBUD+cuorn/5YKYjjm+0MVYNHZUqlCnoF5L+83gZLY378nBbp2vRbo9JPkli
         kmhKTbhXa712Nt2UZzl8RTh7B3dDfeuLg6Rt2P70Fid74yM7QmKKJQNVPiv3Se5drAR3
         i73EGK/eekqdvPz6P9tx31Ae9oivAmhgQg26c/UyznO7xFq+2SNeZahSSMfIbepGhtS4
         20RR5GnKb2vGJdce5kqy28caEcbuI9/+Fn4hpBeNPQB+kyh/zRZUclU2Szfk+FTke5N0
         Tp5A==
X-Forwarded-Encrypted: i=1; AJvYcCU971/QCm+TEwsN9Z/MhJ9Ifz3cuWjPn1HNBli+V3z9RppdJavD0uMyaTicF8HLwvApgxV4jF854hP+24pPLrfU@vger.kernel.org
X-Gm-Message-State: AOJu0YyOxUp78re5mIAjtvK3f8UGvOUC0mx08z+Gf/XmzpFt64jCGunW
	faTs2TEtkJI8jvmoDxjed+8AMu1GTL39HV+juqrQKnniNJhEJC39K617+LH/R1Ji/bpL08UoDPB
	e3wv/e8nXwnJbvka6hiKSn1+YL0QwhZ36KJkNtqVRmqw1/iS1E2M0Z+K9XzhaxVsS5v/3fGRP
X-Gm-Gg: ATEYQzxT4xPLw1sncpwI27/ZhYYKJP+Mcv8YJa5P/PtqNKSuJIl1M08DIBsJfqxhg8k
	zi5ztTW250ppvbdWlM3u8H4KhjmD3nCAyj2EFl18e65RDw7NAdhSQlazTAve/PP8XQZycz+gXTp
	7s8m38AtHfuWlZtcmV7+BRe3adsdh8dyE1kn1H8OmSiOjt8pswdZjQd0rL3zi0YQ/Xg9KHE+RQP
	/iiRxYr1u1QyMBpRkkmggFPxmBrl9UDY/6doVHXVsR0Ytv5QSzRG0oVReh5iM+UdeatZGvoWj5I
	9+JSH+to44UqnnUdNXhelM3gH96puO6YEmc4h3Nk4JECQSoAoIS6YpARuVHrgFygylpYOeTz3Jl
	kwV0CmlXy8gwYzZ0OGX1RIki+wM1WxvjWOf2y6B5Nm7p+6rwhELIQojoAA5vGglje26FYU99n6R
	lBQlVkSX/5lfCN55Gyy4yAq6Efy+Ns204ShfQ=
X-Received: by 2002:a05:6102:6c3:b0:600:131f:b68a with SMTP id ada2fe7eead31-601def4afd1mr357138137.23.1773195106030;
        Tue, 10 Mar 2026 19:11:46 -0700 (PDT)
X-Received: by 2002:a05:6102:6c3:b0:600:131f:b68a with SMTP id ada2fe7eead31-601def4afd1mr357116137.23.1773195105600;
        Tue, 10 Mar 2026 19:11:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e67a2dsm1233421fa.32.2026.03.10.19.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:11:44 -0700 (PDT)
Date: Wed, 11 Mar 2026 04:11:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 5/7] remoteproc: core: set recovery_disabled when
 doing rproc_add()
Message-ID: <ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-5-0a91575e0e7e@oss.qualcomm.com>
 <CAMRc=MedT32COu-B_TsrN+jCrHjde2v5gnA6WOUmMQ2dEBY6WQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MedT32COu-B_TsrN+jCrHjde2v5gnA6WOUmMQ2dEBY6WQ@mail.gmail.com>
X-Proofpoint-GUID: wQQuPHOETlowl_42wg19XVWRrZ6vseWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxNiBTYWx0ZWRfX4yd3uxOTGF4i
 Qk0SyBUdxO6nkmCG0bi+m121G/+R5wxlN5tJyT28czm1EGkCmMQUZXwiDoLgZXg+ghuz1ZlHhmi
 hG4Gz6ZOgCAHMCuIk3emK1+lcfW0d+cIU4QlVck0XURYvfRIgZvCyq+QlvpDLreQ858r9kv2QZ4
 WR92vu2Oz6mfFWffUFUvL8zzobeWvvStY0DtQkDMdSzKpFfMZttXTnp9DsscetwB2KAnDHRlpGM
 C6kQ5fTQJgwQNqeEmTmQLXbG98TGUbUk9oCJCszb/n1igj+8ZI0EjUgZ5f5ISS/EJ94C50B8dCN
 ql+T/2qsmea0Ms5WWUrsxgUO0GR765lNxIGcyssOj2pXLzMDj2hExIBkhfU/VIuQihL8b+xD3aN
 QolGodY7dlwp88btCAPul9yqkEOq0JOsCzqARmvCbibUebytPZLy3i2QOGyD9i1JnOy6mREJ8rH
 9qQlLlRufYdJa4Q8Cyg==
X-Proofpoint-ORIG-GUID: wQQuPHOETlowl_42wg19XVWRrZ6vseWs
X-Authority-Analysis: v=2.4 cv=Gq5PO01C c=1 sm=1 tr=0 ts=69b0cf63 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=EQkD0UdsgqK4afkX8_gA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110016

On Tue, Mar 10, 2026 at 06:50:30AM -0700, Bartosz Golaszewski wrote:
> On Tue, 10 Mar 2026 11:03:21 +0100, Jingyi Wang
> <jingyi.wang@oss.qualcomm.com> said:
> > rproc_add() called by rproc probe function failure will tear down all
> > the resources including do device_del() and remove subdev etc. If
> > rproc_report_crash() is called in this path, the rproc_crash_handler_work
> > could be excuted asynchronously, rproc_boot_recovery()->rproc_stop() will
> > be called with recovery enabled, which may cause NULL pointer dereference
> > if the resource has already been cleaned up.
> >
> > [    5.251483] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
> > [    5.260499] Mem abort info:
> > [    5.263384]   ESR = 0x0000000096000006
> > [    5.267248]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [    5.272711]   SET = 0, FnV = 0
> > [    5.275865]   EA = 0, S1PTW = 0
> > [    5.279106]   FSC = 0x06: level 2 translation fault
> > [    5.284125] Data abort info:
> > [    5.287101]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
> > [    5.292742]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> > [    5.297939]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > [    5.303400] user pgtable: 4k pages, 48-bit VAs, pgdp=000000089e086000
> > [    5.310022] [0000000000000300] pgd=080000089e087403, p4d=080000089e087403, pud=080000089e088403, pmd=0000000000000000
> > [    5.320917] Internal error: Oops: 0000000096000006 [#1]  SMP
> > [    5.392494] Hardware name: Qualcomm Technologies, Inc. Kaanapali QRD (DT)
> > [    5.399466] Workqueue: rproc_recovery_wq rproc_crash_handler_work
> > [    5.405729] pstate: 23400005 (nzCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> > [    5.412879] pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
> > [    5.419674] lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
> > [    5.425308] sp : ffff800080ffbc90
> > [    5.428724] x29: ffff800080ffbc90 x28: ffff00081be833f0 x27: ffff000800059c00
> > [    5.436053] x26: 0000000000000000 x25: ffff000800a56f80 x24: 61c8864680b583eb
> > [    5.443384] x23: ffff00081be83038 x22: 0000000000000001 x21: ffff00081be83000
> > [    5.450714] x20: ffff00081be833c0 x19: 0000000000000000 x18: 0000000000000010
> > [    5.458043] x17: 0000000000000000 x16: 0000000000000000 x15: ffff0008042684f8
> > [    5.465374] x14: 00000000000002dd x13: ffff0008042684f8 x12: ffffd37f69f967a0
> > [    5.472705] x11: ffffd37f6a006800 x10: ffffd37f69fee7c0 x9 : ffffd37f69fee818
> > [    5.480036] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000000001
> > [    5.487366] x5 : ffff000d6536d408 x4 : 0000000000000001 x3 : 0000000000000000
> > [    5.494697] x2 : ffffd37f5703c18c x1 : 0000000000000001 x0 : 0000000000000000
> > [    5.502028] Call trace:
> > [    5.504549]  qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem] (P)
> > [    5.511344]  glink_subdev_stop+0x1c/0x30 [qcom_common]
> > [    5.516622]  rproc_stop+0x58/0x17c
> > [    5.520127]  rproc_trigger_recovery+0xb0/0x150
> > [    5.524693]  rproc_crash_handler_work+0xa4/0xc4
> > [    5.529346]  process_scheduled_works+0x18c/0x2d8
> > [    5.534092]  worker_thread+0x144/0x280
> > [    5.537952]  kthread+0x124/0x138
> > [    5.541280]  ret_from_fork+0x10/0x20
> > [    5.544965] Code: a9be7bfd 910003fd a90153f3 aa0003f3 (b9430000)
> > [    5.551224] ---[ end trace 0000000000000000 ]---
> >
> > So set recovery_disabled during rproc_add().
> >
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index b087ed21858a..f66dde712cec 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -2286,7 +2286,10 @@ int rproc_add(struct rproc *rproc)
> >  {
> >  	struct device *dev = &rproc->dev;
> >  	int ret;
> > +	bool rproc_recovery_save;
> >
> > +	rproc_recovery_save  = rproc->recovery_disabled;
> > +	rproc->recovery_disabled = true;
> >  	ret = rproc_validate(rproc);
> >  	if (ret < 0)
> >  		return ret;
> > @@ -2319,6 +2322,7 @@ int rproc_add(struct rproc *rproc)
> >  	list_add_rcu(&rproc->node, &rproc_list);
> >  	mutex_unlock(&rproc_list_mutex);
> >
> > +	rproc->recovery_disabled = rproc_recovery_save;
> >  	return 0;
> >
> >  rproc_remove_dev:
> >
> > --
> > 2.25.1
> >
> >
> 
> Ideally things like this would be passed to the rproc core in some kind of a
> config structure and only set when registration succeeds. This looks to me
> like papering over the real issue and I think it's still racy as there's no
> true synchronization.
> 
> Wouldn't it be better to take rproc->lock for the entire duration of
> rproc_add()? It's already initialized in rproc_alloc().

It would still be racy as rproc_trigger_recovery() is called outside of
the lock. Instead the error cleanup path (and BTW, rproc_del() path too)
must explicitly call cancel_work_sync() on the crash_handler work (and
any other work items that can be scheduled).

> 
> Bart

-- 
With best wishes
Dmitry
