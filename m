Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE516EB79
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Apr 2025 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745231901; cv=none; b=AeD2YJVwLdHQTL/kzC8qydKtKX2qvrvauyIWXNv12cEIOYV2ROO43MhIACykExKX9zz8uB1US0eSgO/lcpRGbdgEQjV5SkDkeKFNsXVNkYYHAEm4PRp0KpxwwTJOJGolNeQx9zIx0k/IFMkrMQnGeMLHWYWSa3bSh3oZm5Yj9IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745231901; c=relaxed/simple;
	bh=QHaPZuunfEL/BpuzNrYBwWhaKnockJX6CUDjOyAHmZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCKBE9v0JfX7L4SFKx21sf5yuDDIUtPeVCKJE3reWv3H4giMAiEdiTY5fIFr++ne82x00Ae2OqsM6VnGmeJclcnHeYZZ4Lhn6r7zSWyBKSbm2hbW2yTvDgLoKYp115w4TgZJ3A2/q/lMKulD83uHqhDSIeXnriZTDYdeq3ZG9G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZEO4fjE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZEO4fjE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNVuFD029640
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Apr 2025 10:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c33W5SzLL5nQYhmY/46EzHi67Z4y3EfK2fl1ouN8z5o=; b=NZEO4fjE/Qd8/mpU
	y0f1EkTCGoOWVGQ6vBo1IJqhucb+LQzGBFNZhruo/s6P/qmOF2ajSrWJ5jBqJcjC
	RZ3bdE/skeTsAKONIF8vQT7wzBW/+Y2wRYbz5MO+4ib9ZBTfdqw+j+ctgbUrgTUy
	GLbaP7jVGRbn37AEeEvQUleKRzf6AGsw7c56Tp5FsPCbftkteLiIBViQRaWr5YgV
	nHDZ4Vn/GhOyk91uTRSz1hSID6V8e81Juu5ROH1jxYnvyAdUFrFWBdJ/NCP45GoB
	0tBSV8LDYGnbln9oiTL7hWDx7VBxVGRzjOydepbrBZD7tbhoeGewCgX6YrCGd8XS
	kOsp7g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46450pbsex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Apr 2025 10:38:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5b9333642so467611785a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Apr 2025 03:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745231897; x=1745836697;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c33W5SzLL5nQYhmY/46EzHi67Z4y3EfK2fl1ouN8z5o=;
        b=G/su1/tQNWLyTYOQIm0VM4lG8YASte54c47oKID8iVCdbEQUjeawnxafNlk1cpgpba
         cJnqa59qOMXo46AWa+f5IZn2bxBcY/SKeZlX+gP9Sc/TsU2weUH5r/YrNJCXkcFcdUnO
         8xNCiSzuW1uL1/NIi6bVxX7BGQOUWKeDKZNKIiDmTpmAtnBjACNxtm9mIG4C9tCqkRtf
         4xiutqEyXBif4b5Vl24pMGhQW339rEJPqhUj7/OXPz91i+iEfmaKCUZPfgEUiIA6W1EJ
         vfZiosrAo6SxoJnWeL8J8FWp9p7HDNpuYkCJvavNgz9ld41gDMahQHS8jkmESYw392CC
         1Cyg==
X-Forwarded-Encrypted: i=1; AJvYcCWpxWaJPFyxuj5sdgRUE4NBsecopMeGbbGKlvLXOGGggzDNzKUIbAFtVuYS8YZM5wnFiAAZUFd3BcN2Ua0DVAdI@vger.kernel.org
X-Gm-Message-State: AOJu0YzB9QbQRdtuzfJgHagJLVMA7e0fQpZMifmtmF4Mu4ukl/P5oape
	wzs+m+ohrYnbyEKGTJAf20hoSUt9r1tWuAC4+XFf+InmUfPjOWSsx8g8f0OTgi6tijTy88Ig8vg
	G7gL/aw9BpmCW3QOF9R5VpwYjfZgJbNaoHnNMK8XBr+hOu6CvEwE/LuysWkB+O8Z1vF/R
X-Gm-Gg: ASbGncs57id08qBEkNQQ3PN3pXrPxYQVw2+usfeDScKOdP+rPlpqDNeZQiwOQKgrdkk
	+FBaAchzmTHPqLdONxoVUL4w66MmvUFNH67rv/Hs+qQzdo0FkrUIcsBKWMlTAw3DR08Zpcq+aSq
	/oq/wpe/q/fuIkKZakK/5NDfkKjHZmog9T6ZRHbQihThrttRIVDdg2loK+dLZpzJGYBVY5/FYq8
	BUbGr3nsoRYL9IJ3w8HTM4ZjzL9evAD4u8AeMYXLbCbmxVcMHViqrdyTd25lj0MwPvGep1A46uF
	kfY9hN2Hr85TU7W1ZeyA30OP+ZW+b70hQ+eeeeLm1DbXZtjvTe2ZzxNKP4IDOVkocu0BEnD1FjU
	=
X-Received: by 2002:a05:620a:410b:b0:7c5:9c38:ef6b with SMTP id af79cd13be357-7c92800f4dcmr1977321685a.45.1745231897544;
        Mon, 21 Apr 2025 03:38:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqPUXrAc6wUNlI+xH5WJujuF+vftFUpOnZDrS8FepNMUuNFAq0kE7F9gbhkQeBqGJT7gvqbw==
X-Received: by 2002:a05:620a:410b:b0:7c5:9c38:ef6b with SMTP id af79cd13be357-7c92800f4dcmr1977319285a.45.1745231897191;
        Mon, 21 Apr 2025 03:38:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e536c2bsm890524e87.31.2025.04.21.03.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:38:16 -0700 (PDT)
Date: Mon, 21 Apr 2025 13:38:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca@lucaweiss.eu>
Subject: Re: [PATCH 1/2] rpmsg: qcom_smd: Fix fallback to qcom,ipc parse
Message-ID: <viki5krjvs3vs5jf2lrhah6v5rziqju7jv5kbwz7yyvdfjwhh5@6gieypw5owfp>
References: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>
 <20250421-fix-qcom-smd-v1-1-574d071d3f27@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421-fix-qcom-smd-v1-1-574d071d3f27@mainlining.org>
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=6806201a cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=_T3S15piZknK-H0ZweEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: mEfdIoisN9pbxv-QVc_GkMX0ChCFCVhT
X-Proofpoint-ORIG-GUID: mEfdIoisN9pbxv-QVc_GkMX0ChCFCVhT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210082

On Mon, Apr 21, 2025 at 04:04:16AM +0200, Barnabás Czémán wrote:
> mbox_request_channel() returning value was changed in case of error.
> It uses returning value of of_parse_phandle_with_args().
> It is returning with -ENOENT instead of -ENODEV when no mboxes property
> exists.

Why? What is the rationale?

> 
> Fixes: 24fdd5074b20 ("mailbox: use error ret code of of_parse_phandle_with_args()")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/rpmsg/qcom_smd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 40d386809d6b78e209861c23d934e1b9fd743606..e552a9af578e48cfd854a228a4d91e4fa04bf29d 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1368,7 +1368,7 @@ static int qcom_smd_parse_edge(struct device *dev,
>  	edge->mbox_client.knows_txdone = true;
>  	edge->mbox_chan = mbox_request_channel(&edge->mbox_client, 0);
>  	if (IS_ERR(edge->mbox_chan)) {
> -		if (PTR_ERR(edge->mbox_chan) != -ENODEV) {
> +		if (PTR_ERR(edge->mbox_chan) != -ENOENT) {
>  			ret = PTR_ERR(edge->mbox_chan);
>  			goto put_node;
>  		}
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
