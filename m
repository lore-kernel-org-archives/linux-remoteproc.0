Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418813F9F36
	for <linux-remoteproc@vger.kernel.org>; Thu,  7 May 2026 13:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161203; cv=none; b=IM/gRzV3jIAmn3ZS+ECvgJq3XaPYZcGyExsEXajJrXaQXX2p0l19Eh7z6hRDGx1Py6jj+A4cbKm0ax43ifWs9BQ0rrTFqbhUqpzMLgGAVYgpsQZMYdMct3TB0FteWR+YEQUMsT8rvzxsojc/t3i9j4EyoJH6GAh3qObeO3oNySo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161203; c=relaxed/simple;
	bh=CPV5umvGU4gVipwcB9GO2qUnVfCFQxcnQokc3/cJiCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtkc3nMZG/E6JFu1bAZzlSru9GsW8/igGLKByFR1TZeLk/758y8xoBpYHHcdqq6oyLMRCiguCBNo/f1yQ7SRAkbn1Dwezv3e0KxEZWv7oo+2WwNXWc4wkmIvtO0GpcG6FN1USvwZfnEbGWrPqzVfJhKaEYSpnFZPZM/6EGBjH/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hc3iP69D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9j85HDY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hc3iP69D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9j85HDY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479EPIm3463977
	for <linux-remoteproc@vger.kernel.org>; Thu, 7 May 2026 13:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k7zi0BI+dxwYHFk9GidFN8y/
	SPVtm/1LAmw8uTSSU+A=; b=Hc3iP69D26tiMxATAi9HPUMFDD6Z7HqOiYf2zEHW
	2tr7Yiq7MYD4voD9spB7aB0vVX08NQVwzJ/idjYp/Lg/9WN5i95D1fpzDXLTdhUZ
	BLwNM/iyG5mbel1K2V1z6spMhoOXlFfjClK3HYZEcCK5WheX6kMfyfXt5OUadNnB
	c2WIr5qi9UeviQwbBPRPH23uIbLNyxFNO3uQjOz7QMwTf4WOW7El+LNYbBpLP74d
	fjR3zqiuozqqLgKImrNyGSluCuMyh50xWPe99EBxyYI6ih69eqL0rn9ONtOqIzAP
	4TEt79feozB6Pgjxv4Zl+yrlRku5TS0DDknaVUpYWcVoeQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn2aed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 07 May 2026 13:40:00 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-62846961f0bso1142655137.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 May 2026 06:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778161199; x=1778765999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k7zi0BI+dxwYHFk9GidFN8y/SPVtm/1LAmw8uTSSU+A=;
        b=B9j85HDYPxTXiHsR2PybIhtrdJijLTvtVC9F8N3v0A4SVvwL3uTK1ie0LHjmKS8HVm
         2e2EidPYD18XL6L2zJeAxG1CG2AhzlkHDdJQ0tBXshaphk6IrMsiCtQ009EzKcpqVCEt
         V22evvvMSl7mCaiKuzZQvdwCwx7eljFhb0wvhd00ajstyarP7YJxNdXp8Nkl7/aJuLdJ
         QPawko1b8gCQDCT7K7IaV6XmfFQujVW7pBoeWm8n+H1+CV2vaYdod4zUs1uggqKyZ3qu
         GeotkdHk2OD+lpvXj8f8LcPKl07xo/5UkU2tminIkpb1qvWT3T0ZxZ/sxpphKHXmazwv
         DDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161199; x=1778765999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7zi0BI+dxwYHFk9GidFN8y/SPVtm/1LAmw8uTSSU+A=;
        b=koeCMge4pk0+SKjnNOUV8spG9pS2DwXpf5USzRZlMd6bUTTOKzhII/aTD7WIc5b6IG
         9tu7JbFbj6/1PnasADO35/j+ZwTzzrqQXoefTUFZt4yUBHSZMgTlkQCzYr6t8d/J/w5R
         GnsZD7pWboG7EELsFYRJdDNVAcgzLh14n8VBLva9dKnFGjv5ILq+R+Ipe/B6qMmh9lbR
         oovt4EU666qDmZq8++wG88ym+Lafw+Ytuk/GEEr5GutBpd0+1XH411GIKn9QhdN7F7Qd
         bg/OMhcZt9mrmeZ4b84H5NKWFAPVE9cpkL4Lmw7JlQjB48r3g7dnTjoBAtbLd+I190HI
         sxYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PSUdvGSYf55RLbSzORbxEsXU9L7g4Dhs4YU7AjcBVNJp9KIs9PBP5Oo3xRIhbMLwj8FRhMghBTOKXRv4LDbwJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxmZ1viegWh68cJtHHJwFx19dfcW+LfXbqjauaZBX7hXvhqwjNr
	WWQDDhWso2pVxPr0qUsBHtwiRV3L6rrgkWsyYlFDSsbD8LVEIy3O3GatFt8qBWAz5rAV0W2t2TT
	EtFE5nc7LpQu0ltuv5hozTt45eeWve5A7MienBZJ9iMAt2fVWIK9e2zwEKmrCYIl2u4I6RhON
X-Gm-Gg: AeBDieuOznnntufvC9jcMx6tk1Tt2/3vYQcx08iTd9VfbopcrRU+hdwA45mQW9bzCdj
	5GQO9b8NrWCwRExN112U9Cd613o51NRnuqYpUdDlAUmiss6n8XT/d+0hzTzvVuFEpBNPn9C/hth
	mE+ugf6BfFyXYasUerpzk1/vU33asCWFNG/+Toe+3H+yL+ElHcf8VyvH0dp/c4CJOeqjw+qRhX/
	OJIv0sfQCch2LDp6cR/ccGYqilpRvxzaFG92H5NF+XZmLuPnbnVmeW88buFAngxUU8MFLxQU5F4
	7ChTsdOvQAgv9LtrW2cy5qaU/VS78Yk7cpOYaqKNqsze273r9/2AKwK4w/j0xo9j+sgwvzAq33X
	DYxBlmb2x+NUnukvpSPeKfWp8ZJf428msZ6SC8aLcH/x7CjGgrPQnTgELNDRzJCMSIJAnuVPXWT
	dWIB7dFI+QIn6RID/rNmO2P8M+HcxuVFUxFxL0wo015wOI4Q==
X-Received: by 2002:a05:6102:cce:b0:62f:3abe:907b with SMTP id ada2fe7eead31-630f8e78839mr4106431137.4.1778161199278;
        Thu, 07 May 2026 06:39:59 -0700 (PDT)
X-Received: by 2002:a05:6102:cce:b0:62f:3abe:907b with SMTP id ada2fe7eead31-630f8e78839mr4106396137.4.1778161198771;
        Thu, 07 May 2026 06:39:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c341848sm5626034e87.65.2026.05.07.06.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:39:57 -0700 (PDT)
Date: Thu, 7 May 2026 16:39:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support
Message-ID: <ybuup437mpu346fqhnmyuqkj6satxte47sxg25mipy6mn2yvdr@xcjlcbwf5gum>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
 <20260430-shikra_mailbox_and_rpm_changes-v1-4-61ad7c57ef27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-shikra_mailbox_and_rpm_changes-v1-4-61ad7c57ef27@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzNiBTYWx0ZWRfXxfjZ+kCTsKu8
 J04n94qw0lJpwh4PHBjRsGFpqsgJdFOC22Ocm4f3UIq5XlHBx+tiPcyWeb05jHygQMKdO+GTD2R
 SuaBh8I5LjDvgGT6qND5sOEcEAo66A/T3Vkm6bKbOx2PvLBMd4dPIuAlUC7TeWALmtZm/58kRDr
 Jg3XmstGQM72vzgrVW/e6vI8ouWz9gorWUiiDGH9DGGZOcKDm2aOsrItzbbl+TVJnDEGCQAKktE
 Mnh/tNT2m5aBKOn0Wmmp5E/iOW2SZcSUjG0R3d/9+d90NmnJGMlcvZzwN3e+i168NesALdQDBOu
 p4PNCZE3yrUkeCn60vdIOZvTW6MT6GNW56tyi2gjkdgxVsyl1iBl2TeP8txbXwCXm0bMPTAyqto
 2HTDL2qM264mLNCqpJzh7N+ug4XKfEg3uKj4eymCJVPA2D7kuGUeiAsSCgikDVyOWhLLA9jU6zO
 KYD2t/+Ebl6YpluQ3yA==
X-Proofpoint-ORIG-GUID: 0BvEv3KLkwMfAilbWESYPnIFzNuabsPi
X-Proofpoint-GUID: 0BvEv3KLkwMfAilbWESYPnIFzNuabsPi
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc9630 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=GA4JE4aC73f7OREyLVIA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070136

On Thu, Apr 30, 2026 at 03:14:59PM +0530, Sneh Mankad wrote:
> From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 
> Enable Shikra APCS IPC support by adding the compatible.
> It reuses apps_shared_apcs_data.

This is obvious from the patch itself. Tell us something, which is not
written in the patch. For example, why it uses the same data structure.
Or why we need separate compat string and entry in the driver.

> 
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>  	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
>  	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
>  	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
> +	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
>  	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>  	{}
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
