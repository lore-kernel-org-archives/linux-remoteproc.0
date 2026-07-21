Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6924F35C68D
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 21:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669137; cv=none; b=AF5sMWwR8vX1ndz/t7T1N1+h8n56xeuCen0/SpPVf86gwvFgHDKiuWgyIEUkW/M8sVjG4k6DxZ9RRDWnlFLD7ZUR41qgKgkZBNzZ+2CNfal955ITwOY+SFP91YBxRR0GpV0A1pL88EIFGBh7BUfAol3dKTZxoBKRjzoSOfzK8kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669137; c=relaxed/simple;
	bh=x4fd6nwS06VnGNebx9fFIHUgpx1z0dMg5e5AR6dDcX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9Ar69it6sdXGBiyMmntP8z6ZwW5/7ae1FtfSCYo2EO7q3lBXniURpwwAHn0kAerFZqIchqrnyxWAunhs37igLWmnn+4tCzEl+V3SSR7dKpfWYz+NuIVhIHTE1zSU856You+aLlsC9Ov/yqDwh15Zxtl0jo1znjP1lu7nEZjMC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oO0pHJwv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNAxbj2b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oO0pHJwv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNAxbj2b"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKljCt2830549
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 21:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nOBcsOUK1A8J0B1Rtx9vb6g5
	G6g0UUX3wSHuWQvj56o=; b=oO0pHJwvx/1e4vMFRsjasfLRri+r59P9C21os/FN
	1MG8Zx1W9jzsnFhmrH7m+8hWgfrcAXowy0nO8XtpVDb5rX62zsqOcbs3xixdtlrU
	Doc8kYzqzXLV4fC8eQAkUhMpxMvAVb+ENQZDRXycEbA+nmslWV9IDwn4d/BYPOXK
	4GPxAeZw1Wsa4LpRkCD0jZbc6Gsrxej/nh0ww+mZQrOgKHLYwYGVSSt+qgopWYU1
	6ds/YkoqO/JcBewhqMpkWz+E++UprKCprBmH9dMfC29kfjj2y5ocDXWaTI3msr4n
	/zMOqZnp3zQL6DgKo6+Fbtpg+spxe4m0Hj0IOglBmkjw0g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6a8wsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 21:25:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0c46bfb6dso317694606d6.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 14:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784669135; x=1785273935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nOBcsOUK1A8J0B1Rtx9vb6g5G6g0UUX3wSHuWQvj56o=;
        b=WNAxbj2bkyHm3DEvSPr7Uk7EZY21VN1t9WY2CCQy00VAWEMR9REDW6SihYvkK22AUh
         iv3eUaFfXax8/cHJSOHVfO+5ehZ+XVlAchQxzc06R1THBcDUkCw3rC23UY29JOQmukZh
         rG67zovbR1lPt9Dp0QgrA4IHzfM4rrRR9403KK1L9jWRxWkou81wa8hFNLxN4ArMo2rZ
         H02Ha50TG9Qn96v+JjB+a/3R0N9sjlCM9hIMYaWLy2oKc9OdGa5sFCN3BWJHOrKDKFQD
         lxXw9ROt2TQlg0Y9m8czMc7xUQS6O+9ou91bmuuTaNlGMRkrXja9ZK9plt04i4xwOY3c
         plmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669135; x=1785273935;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOBcsOUK1A8J0B1Rtx9vb6g5G6g0UUX3wSHuWQvj56o=;
        b=AgVJLACqYb/k+/RMxPNQzSpTtG9Ir5jwMcd40lIgW1IOXszbyQjPGEPd3vS1e23KyP
         xjpToDhKrVhWlI7vUxzsjsj9913YT9GdWDKQMGoNGsYO6JaTRTIHTJm+MZmLMEQD8GxE
         u+MhcoNJvBpc0Ya7qF4Ek0k8i6pDq99JI6qvCa+JD/qUuCvaF01PV5AT+sMcHWv/6kcX
         ivJ5Z3xccasFKnV+yTmq+/m1SPjtaEV2YliVf3OeSN8aJ912qMJi7NQQmlLQOYX9hmEi
         gyYRoOQ7VG+2ok4YxjKeeO+2qmvXHfMB9Iqb2DZD3yAzB998cvx/wB9yS77PXWAjAFpV
         PZrw==
X-Forwarded-Encrypted: i=1; AHgh+RpI7W8ZQpKekkEvajo6kfZq2s3QsQF5PifOUiHQbrttMxAla++o5NyVY3H5hYhZN/YfeycDODT+V6TkGF1N7+Qw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwy0pt3+1zS+ytpuNMLO+97vLtZ2fyVjy/grJ/DZj7lq99zJ/x
	0Z6zp9hhi5phHdw1ibmv3YNMVVSV7J0+McEF99etO5e2ZaSz9tEJbd1U/faSRT5yfLuEqcWA/9g
	ieI71GcYeb21Icekk+8M+kJ0dTZ7CsmT3qWjFXwjR+HyQsapwhZpvz/xrehIRpBuhGCmckXkG
X-Gm-Gg: AR+sD13Nx2KBSa4vpZs2ht3Tstq5shabbkr3aV+sKQQcCL/Wyv+ghTBXJhEyUw8YWaz
	u9hpVd7dDD4wUPiyRiNmozgNU0HacPkf0EhmIL72RCx3ixn4DzoREsEBICi0lF7kZAPSs1rubpW
	9/CN5EtqtLazwDaop6PXGUlboL6ueBIQNbYRbXJtwGE/35vA2M4bcewDiox08Gl8X55X213dn4B
	zclv4AFu/Kzjzi20VmOous2NRqGI2mhMjcjOaCFtT056N7pnDg6Blny9XmqEmXKahr/UxyjQt85
	VrFM2xsZp3D035NDNn0BVShKEjVVLwBJ3+KcsIYnDuarq+hzlMcGKtIAC1EdJcbksi1jhmyO7NL
	AgD3wmVl9yI2Qu0vZrKI0aCl+x+kwDjsnd4+XEdzcWxD8Lkuivc8yCTN191JIyM1BUbyIg9gVC6
	FRjFzAt0AF1vUWvQ==
X-Received: by 2002:ad4:5d66:0:b0:905:d42e:557e with SMTP id 6a1803df08f44-907783d5d38mr229479846d6.53.1784669134695;
        Tue, 21 Jul 2026 14:25:34 -0700 (PDT)
X-Received: by 2002:ad4:5d66:0:b0:905:d42e:557e with SMTP id 6a1803df08f44-907783d5d38mr229479396d6.53.1784669133982;
        Tue, 21 Jul 2026 14:25:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68883fcsm1200441fa.8.2026.07.21.14.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:25:31 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:25:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] remoteproc: qcom: pas: Add Eliza CDSP support
Message-ID: <5kblhly3k5jd4lvb6cjiwyk3d67ugxp42ysmizb5prkpc4iuke@v5lsc3kt664m>
References: <20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com>
 <20260721-remoteproc-eliza-cdsp-v3-2-557b5d02fdd9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-remoteproc-eliza-cdsp-v3-2-557b5d02fdd9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyMiBTYWx0ZWRfXwJg4ycvLvfB9
 tT0p8eKBZ6ajb2GvNSpbsK1fcSGFIK9HH1+bUX56QbB9vuwoAmvX8c0cqbbym/m9t/pnC3zBoxk
 jUbXwShU0zIviDLha/rdraIHL7jGSN/7EtH/dq65wT8NpDW/dlyJ57lQFzUUMa3Eo3dQ13IX0jb
 u7I75VT1WIA1HNuINJmISILm5hMo6u5v1SqGrJBKdH27y4iS4wyynrwSdfWpip+i+RXCquCWHVr
 NKNqMqDUzoW78eQ3LLkXEAwhtFew9RQhyNOE0Ity5zbwGNTKJk0RKPQ6HhqNhfeX+3dKyVmtg2b
 12ksScOuDjFCeCeAavNFiuxfWqa8x+Je2ZlJVfdJUUIHSsydle+OfcOCdblcBng+vsk3PqwYFM8
 fXhaSEHnW7CLcfmkr9X6L3FgHZjxNNz4KSpNT40zRPMKQwa58bLP7DI40qIRiTGhMkWH0FGr7er
 NwYxpy2Um68LSnE2+xQ==
X-Proofpoint-GUID: vdvNRfn_gxC9FcFGnTRbL40D5-VxSIiR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyMiBTYWx0ZWRfX3YjpsfaMEKl0
 0AuXtWyrlXR9FnDpzKdtuR/UKJZ7a9VUm0mjfco9rxE/jkzJ8p5HCLenyxPZ7cz2DcSUECg43wk
 j1d/s37rAEBAKNAnzTClzfunuZw1KmM=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a5fe3cf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=FtAS-mdK90XYVRSJJl4A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: vdvNRfn_gxC9FcFGnTRbL40D5-VxSIiR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210222

On Tue, Jul 21, 2026 at 05:19:58PM +0300, Abel Vesa wrote:
> Add dedicated driver data for the Eliza CDSP remote processor. It looks
> almost the same as for Milos, except Eliza needs region assign.
> Tie the new driver data to the Eliza specific compatible.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
