Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3E6385D78
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 18:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360822; cv=none; b=rELN6tFtx4Qkgz337Mlcg1rF8hSYWJQIkeRG6cXguYTWsSeX3RzJGs8/zfpb7xucMB7szTNZVuThhiSOyQuf6GX72F0MBkQOpE3JuYJhmuhmkHU1KbzG8R1Uhq8hPvhfhNhMsvZfNiXoAzKDCmEKGjCumlouhZeaX8u/pxppZPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360822; c=relaxed/simple;
	bh=JbvQKu3jFiiMJpfmWiYfkDJ6BdE8ppfjO1thakOUVYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMb9r9H/xRHJcRmDSCup+Js5Km6t9vVWp67td8+A2e+C28qpsFItIJghu4xWWqGdRJRqwGzbT7tl8AmyhJ3QqgsHhvec7+nI3I7FlP6E3vIFUR4PiAzU+EpFRG1Y3W+PYW0umRI1dvmDk/shCNRyo8G8KkZR9dNPa5TujyO2f5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G48WVmSX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IPw/4B+K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G48WVmSX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IPw/4B+K"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFIu8958831
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 18:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u1CGWMa1sF/4QzFpco6JpVT8
	kFVNcb1a0t7b6jTPoko=; b=G48WVmSX5lS7lRwJ90DC0HYcfrpir52E8QtA/PN4
	qGDamgNuAz1QGMUNOKuYT1XUc1h7Cby0EHf+x4HdebZoh7SVHqxg9Z8SbnrNDp3y
	O1JMvcqUxBuoLZB4tu9Nh/g1uyhA9p6UWECl7OV0tT0l7wu4X0D9bIkm2iXLyiqT
	2GYWRinUmFltBnZI0SZ+bDdlOIDO8k+YCq0GSHv8BteaLnhrKSC2MGuxo6iDIGTR
	PTq0TF+B6wkYG/4/0Z8jevt/Z7f3CEgsfOZUpppFh7Wsp97Pu6Dp4RtwGb140deA
	wxt2tqjy0tSIXKAx9wVEho3VBFM80etMf4mt0z4wrsgHHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9aqfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 18:00:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d1cae5740so386346285a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 11:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783360820; x=1783965620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1CGWMa1sF/4QzFpco6JpVT8kFVNcb1a0t7b6jTPoko=;
        b=IPw/4B+KgbZAl+keQw+k9K6YDySK/QTQblvDmQKKRxvfabk2Y41soyTQh+EcWjVJmK
         UkrNAdlk9a4Fbp80WYBUo5lpEHXaTXpbcr1xP5Gm/f8J/u4DY24ExE8d5Ii1S4P1Utdg
         /XVMABldhAAvCtopeDpczbkXaz7r+GDF8ckHoJnrAPjrwsfjWOPxdQgbgE//589NiX6/
         HRX1ITR4wj6sN5KwwmV4xHA0qt/wEsNV8DhHhWWqLrZqGVIqN0brYRZTzunJ9UVeuKWn
         zfjA4tAQDtKWYtXq60yA9rn5KSARgny/v2t3vj4W0C8OksdfCt81ZLdq+SCEleIIBEzr
         GmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360820; x=1783965620;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1CGWMa1sF/4QzFpco6JpVT8kFVNcb1a0t7b6jTPoko=;
        b=SAMId7F9M/DC0hiBnRJHcWauuC3L0E78tNXHj8E8erYThopPcS7sFRVbH54TOjQ0mc
         ERpeD0H3Dumh//X4lt68aZmNfWFRrQBZlRfPMWng/Mz2eaiSnaSE1WGhLrMy99sC8Jex
         A8EWzoMlPly2qZ0OtChl9UFNzeKNesbYRRq7v7KxPDjrUQvPyzj6cq33BNYjVqaTStu0
         3YDpTv26i3OzPDUB9P/XmHqsyoDhUeuWTGx9Hpo2nQx9Ke/FRaLuY1YK3lHh45DD71Io
         AclOjdGoY4aQwtSwPTaX/rXDQWcBuLg6OAcsknghLGJl5FgBra/afuscLMqnwWbkaSPd
         oMgg==
X-Forwarded-Encrypted: i=1; AHgh+RruS2Fq6mdg8KcXvKOln4DUwbEjEHyrIgiF8Q7A1vsv/YaPqS8aZLRofNCKZCrLMbaEhi80g/FPTgkk29sc1nJW@vger.kernel.org
X-Gm-Message-State: AOJu0YzwdIvSv0BZlugnuUEoORP/gFfvQW2CYnNLcG1jCGPnM02BaCVt
	elTG3+6ccxTsgUexGWpEPKDFJ+jjocIM3Awe9BjZ81JYpkywwg2iw3iUqyYhLeHgzEZaFg9VJwQ
	qaI3bVqBA8n/jQ6fsnAaOxKWp2T2rX2Yf8ZjD3jepXztAbNkVw5qFexo5vMs+h0aaeUlNr/sq
X-Gm-Gg: AfdE7ck/gDy4vGF11wwqoDrb/ef9E41J89JgFT0O+AB+0Smr9BoXvzgMU45BFfOJ58F
	p3CWQDFC9/BpP2Dchtmd9AOhhingPOWiuCltAX4hgATpN9hshOVPk0U0tdq8R6KjBZED8y1IaoR
	+5gwSh1is3jibMZUCs0m51YwlptAkhSHmO21gZ5EeZSmjXhWnbRmB9EHijZiK9SxG3a45Cu/MZp
	oH9rIbghghhHHifD5msWTsQbk50RpAD5F7Rznn/cPBn2cOfjkfKtGjzh1MdBQb+9gx7CGcIM1Y6
	MZC2eNOYZlK5sif2CM41qTZwasqPJ1We5cly9pBRxQYOMtNnyKoRHsSWREmA4EmL/5roAZZ2OLe
	QdN858jJ34f72gOpYurQDQTTL8JSXVBVffuv/ZfJ2EAafg/cyTlnverU4PgSBmWPnY1g9/fYuO1
	NcIS4GBHsXmdnNgzqK/PcSxZZs
X-Received: by 2002:a05:620a:6488:b0:922:a46:d9e3 with SMTP id af79cd13be357-92ebb534971mr215618985a.1.1783360818992;
        Mon, 06 Jul 2026 11:00:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6488:b0:922:a46:d9e3 with SMTP id af79cd13be357-92ebb534971mr215608285a.1.1783360818403;
        Mon, 06 Jul 2026 11:00:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c38fasm3077629e87.67.2026.07.06.11.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:00:17 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:00:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/6] remoteproc: qcom: pas: Guard dtb metadata release
 with dtb_pas_id check
Message-ID: <ztp6pqmnge2yskxxinxpxi63eslwfv73wb3nd52yj6cdm6bknt@oibgffasssj5>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430191253.4052025-3-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: j6l00AGw39dxsMuJACO0PNBeRynewv0C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MSBTYWx0ZWRfX9DojzQNLQKUo
 5LALoNrWHTpvIaazdrYNPkOg8YzdVFHvXZJpM5BnJApsADUnTiPjdZ+M5FAwFiJJJ6MtbNi4Oh6
 dE3wAzsBhOAgqaLJl0bQ10Xd5TYhodI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MSBTYWx0ZWRfX1Rf04763CWKF
 wRW4/OQ8Pk6cOgUlJ3rpxDYeIF2PKmQcyKkAbG+StNbiDyfeguOwSH2fVx9OWbSl24FcbAbTlR+
 DM+1QlXZgHnqeBT6dAEa82nk7p7q/xjoSBlbxRcDnk/vqzRHM8oprFwwiJ8MciPJ2tuLANJDF6Z
 ERn1D1r7vQORzHDYOzFb3hVqLHAFUFZ7yqmBFUJfNw5n2lL2zgNLS8+hYai4gzSKri9zgMCUC8+
 sDY/dko0fILX8g7EcUK7/rCyaBfq25ob2gAQScySj0d6WW7jmS+3AyNoaBHogjzN/wJhQUViX/H
 1wecMHLzgf87J3LaToC2ZuAjA5mMUgvqTEWgfrzSI1NiYQ++buSVNpsltJXND/6xIP+JXa4r6vc
 GEUdNyJEJMPU3HQbXbFQ/SyQfcFK8G34QmmgyTc6x0PnHV+KJ8N6NpeWRyDCp7zNlqDPObynkoQ
 f6hDshzGlczNVRNg1Xw==
X-Proofpoint-GUID: j6l00AGw39dxsMuJACO0PNBeRynewv0C
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bed34 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=RnWc8x33OkAxSZZ7CTEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060181

On Fri, May 01, 2026 at 12:42:49AM +0530, Mukesh Ojha wrote:
> All other call sites of qcom_scm_pas_metadata_release() for the DTB
> context are guarded by a check on pas->dtb_pas_id, but the call inside
> qcom_pas_load() was not. Fix this by moving the call to the guarded
> block.

Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 

-- 
With best wishes
Dmitry
