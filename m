Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3BD33DED5
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 02:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773369482; cv=none; b=TiBQe4lDpc5ec0feQC39mxCG+n4Bbw7QnWcdjK29wFA1GYht105XCgxg33yzBaRdI50eJEABGW5stDJkoF0QcUScGXIgtGCnpUZtpvdX7I6SGm+9o62QhvXbwY1PnUbtaQhJtv26SCWbDG62gQ50GxzJ0w4crpJVxTnyRR+SEvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773369482; c=relaxed/simple;
	bh=kHkfzFfuvqrzI5Gk4X/AVa6vzJ1jsczG8A8Hq19dAm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xp1gAxYEL8ldGETTWRfs25iFZJOlDj19Nh4p44ZUhjfzcAbDu7Jn1wVp0y1i1t3IXhASmEl9dn5KnDBTMVSJU/TJOenwo/4rfhyxB7fu5CW1JzvK7Aso5AxOrocq6V4X/PeTDvBE4TbnuUYl1N2rsk20AEMEY5jqWA3//VKhtlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxeAXnsv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csa83kkD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxeAXnsv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csa83kkD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CJ0KiB1922483
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 02:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=edTbfdYk6vj38n03jA9Ccdlz
	+0y08pAQYAZXZkC8ewE=; b=kxeAXnsv0gSMRvu1meDg9mrP7Hrsj9MCtT8zO82+
	1SpBXboYkDnL84MBy7Y+exCctZG0grUmN9YvO7Jj8SYJFMx5w0ZvH8cqL7FNfE+2
	XaxvAQrZA4vEbMS2rwynVJOzZYzeFknHwjTbsn2GaAwhppuvtFGxZPtzTu4GD/hs
	pd5ZnCWu+4XQKXjjT10xyUCHfpUGUsASx5/+NVKmgCxEDRx6RWCpk11Wq6RmjpCi
	83u0Cp+FBWCbw7x7q/lODuooTKNRTJJJF06tCd3D7od0EXxHVgWb82iSQE/ZPxQj
	6EytNt3MTTPrZcAzI17p/SQcR8DAipInakrWlnP35+n4sw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wv717-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 02:38:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899f474fae1so239208736d6.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 19:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773369479; x=1773974279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=edTbfdYk6vj38n03jA9Ccdlz+0y08pAQYAZXZkC8ewE=;
        b=csa83kkDax/lck8WdBWu88dpg+jcb60J8spA4jScOgCKmLDUvaTQCfMbN73AWU4Pty
         XHodDjrmQJNQhfDC5jaRxHmc3sqbYv6niySvLpT/MveKA/QYzwXV6fXTWFPecC5IjD+K
         Qf0rfzwr8NRjlmETvqOvAOVEe0zJwjl9Of8AK7wuKze5UxM7on7WoHSsKfyX7gXCkDiu
         Lf1JiALtFa5aL/UXArRcGbR70dUj+fZkTXs5ZghpfFIb20dR2CXm8baEUXx3ZRZGrrO1
         U9bHkimW+NpnyOstN86eGSJf9futpFtNEzp6RxBmvathhAYqbsMf/WiF/M1petxzUQxi
         rKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773369479; x=1773974279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edTbfdYk6vj38n03jA9Ccdlz+0y08pAQYAZXZkC8ewE=;
        b=dAtMcOXfvzqZZCB6pY9gsbYs3qXOZ0IHhyzk6lzGwLPkN82xaJXxyltV6BR+8rcJ0a
         rY+sn57GfRlXQs7x6zICwGqeu13ebWT5nh5hFyxWkt79KRa4Fuq/JioJYP0/LCcxaLbZ
         nWR/pQkwGo1A3hKvdAgSK4KWlZfD52w5xwwfKjL2UH3RXhKOkhUtaK03B0G5v4SWumi/
         3ofYyhvl9ikiDr9aU1OJ9DRp2Nfzwj0zTRcMWuzKAIt4nnkJf7cxnFGLVRLG4CpIEYwq
         YMHtbixx+sh+5oMN5xv8tamwF7hv++oo4r58PfzYd2MnMPcI5YP5Vsqs4crKmSEw45nA
         3VaA==
X-Forwarded-Encrypted: i=1; AJvYcCUfrywESmOBGKjlpWCnd593jLUnIpIywvPtCb4UCMI0ZTS36HPIkQBmLXHwJ14Apsljh9HXzH8D63GEY+BhnC9h@vger.kernel.org
X-Gm-Message-State: AOJu0YwBsU79bCh2h9brVZR9NjZXAxMNK4ZAnl/aJgVHd8+0i72bm8ac
	mV8IXHGFywNMABiS9Mdr6IvkNeld7asDgDWk9XPzKUMuW2nHdWa9rnsaQTB39mUEjJJa+Uo3W79
	LdFK6KF9ec6zT2hbxDe9iMWepjZBQ0j7eRxUfJ7WvyKmkVy6G0BimFd5bCWQ7C2ebzvy5FB5K
X-Gm-Gg: ATEYQzwy88Iaoa300Pfmk4qQ5wK8T+nenmAZh1PU5cZmzBVmysN2R179hIzu0ibi9ZE
	f8RL7dSYcGpqtByDGOAaGYipNmAC67diYB4QST7cFkWyQTXm+D/HFQ6HFccgBytyZoUvJC87Fag
	YYwXTUbD48BZdtUbNl0pi9TifILxQHclUrB9uwo3MjjxtcmHaoBpFrt1eUKRSUOaZrxJtE9Y4II
	7tgxoxnJssPauO1itRtoYU+VPaNEVdkudWr5FtULuhNH8LWD1vxZ/rp+Mix18ZYvHpZoPqbyD0T
	VqGlHEZh21Zr/raWnaYZsHmYZK2mRWuZ+gdLXP6OHwRGWccOGModBizu8ckKeU4F6ez83o+6cXs
	j9boOf3K5X4OeSQ6rdCA0Jlpa1c/oVZmsM3NZjuGFMnAVN10uUMktmrwwFCTbfMZh/Vc26DvAkr
	vS0+moBbXJfScY5YtIFOIYxd9kBJv03juUzME=
X-Received: by 2002:a05:620a:2a0d:b0:8cd:86a2:33f9 with SMTP id af79cd13be357-8cdaa776eaamr698694185a.9.1773369479267;
        Thu, 12 Mar 2026 19:37:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0d:b0:8cd:86a2:33f9 with SMTP id af79cd13be357-8cdaa776eaamr698691685a.9.1773369478802;
        Thu, 12 Mar 2026 19:37:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156358066sm1275495e87.63.2026.03.12.19.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 19:37:56 -0700 (PDT)
Date: Fri, 13 Mar 2026 04:37:54 +0200
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
Message-ID: <ymo3kf4bsaz5yh4uwpk6dapfuzujepru3szaa4ujge7vtv43ka@skc5xgejj6aw>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-5-0a91575e0e7e@oss.qualcomm.com>
 <CAMRc=MedT32COu-B_TsrN+jCrHjde2v5gnA6WOUmMQ2dEBY6WQ@mail.gmail.com>
 <ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m>
 <CAMRc=MfRxhXXdAEX+Gm-vJbQGJZ7QRL6RM2CbhcLiqicyvftdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfRxhXXdAEX+Gm-vJbQGJZ7QRL6RM2CbhcLiqicyvftdg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=GcoaXAXL c=1 sm=1 tr=0 ts=69b37888 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=XRqFVi2MeEOXw3go7kIA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: d6QlFWXZ8VhTpz8BWYeqGtSdTJE0BzIp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAyMCBTYWx0ZWRfX6bIw0BwQF79h
 tvZXsNVfF/xGkU+qSBhYkbw6SGa4C3euG6Q92f8coFyPVC/lN6Gy0ypEtVa5O1zOwCn6qPhTlQd
 4jTPZ6uRLriklWFU+cOaqtsKFPxMnZWD1p0aVSSJJdIjoW4REIV8L8gWnBL+Ut2GC1qCQj3/9Py
 ibBEy8SxQWIjTW7YINqYi8QBjRVL9pz/23DSiSunU3bDibo+UOgN/ABLwMYyDkm1d6nn3isT7QO
 Q2afJihvr243oyTQHmFdqKNQbTR5yn5mQ4ZR856C7F+R2jTehk1QzpY77K0gM17wqXkjxSJJ0v0
 lVOxCe0S3LGkvqn43FWvsNL7n5A9qicX59ivK6xkRssbgRG8MeGgdY4x4uKsEs+p53MvY74C6R6
 g5/Jqu1W4yIzfQv7yEYAg3ZIF9zxalka1zMrrSo1QC3pSpi/5A60Yp/lAQ+f4dY5xle6j1wlZ0t
 iA3jeTqLOn1Et0FgvRA==
X-Proofpoint-ORIG-GUID: d6QlFWXZ8VhTpz8BWYeqGtSdTJE0BzIp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130020

On Wed, Mar 11, 2026 at 01:39:50AM -0700, Bartosz Golaszewski wrote:
> On Wed, 11 Mar 2026 03:11:42 +0100, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> said:
> > On Tue, Mar 10, 2026 at 06:50:30AM -0700, Bartosz Golaszewski wrote:
> >>
> >> Ideally things like this would be passed to the rproc core in some kind of a
> >> config structure and only set when registration succeeds. This looks to me
> >> like papering over the real issue and I think it's still racy as there's no
> >> true synchronization.
> >>
> >> Wouldn't it be better to take rproc->lock for the entire duration of
> >> rproc_add()? It's already initialized in rproc_alloc().
> >
> > It would still be racy as rproc_trigger_recovery() is called outside of
> > the lock. Instead the error cleanup path (and BTW, rproc_del() path too)
> > must explicitly call cancel_work_sync() on the crash_handler work (and
> > any other work items that can be scheduled).
> >
> 
> This looks weird TBH. For example: rproc_crash_handler_work() takes the lock,
> but releases it right before calling inspecting rproc->recovery_disabled and
> calling rproc_trigger_recovery(). It looks wrong, I think it should keep the
> lock and rptoc_trigger_recovery() should enforce it being taken before the
> call.

Yes. Nevertheless the driver should cancel the work too.

-- 
With best wishes
Dmitry
