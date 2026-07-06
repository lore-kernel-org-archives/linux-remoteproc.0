Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC5E414A1D
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 18:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361434; cv=none; b=T8Nlb5huFoSKl99tk/5j5YPdoR3Oy4dOYLAbyj/LIUDZO7fsbIqi2f96aWkeUkdl5w0UahdfCyhrucll0QqagrEyohB1qs6x2a5JHvMismHw0G+jWwF3MPGGy98XG0vxq+LbhqR8yJ4Djoed830B1ysiNmr5B7kY0Ax1Nu4MfQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361434; c=relaxed/simple;
	bh=+wb9VoFzS0G95lmqtUaHYRTjw6dW96UvyaOPI8DWML4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgGTz93BViGmUd9w86UPyFWDJxrMiJGhYMIhFijVJUQY4M3BfhI6i0u3TiOpV9EXaeNCwnfuQ219Vk48JSzNGBkYjwb55jCJaYJgOIKqM59hikKTBAjRZYVWfCKmF5U06iYmjrufsRqEYg7Ca1nzwycwUnLk3YLsjAG4xhjYvqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbzRgBZ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYb4OPuK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jbzRgBZ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AYb4OPuK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF71j833022
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 18:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4Xk/b4HzWXEdWqMLmjiSukHN
	p9G6v/npFf6Co8X4+FA=; b=jbzRgBZ9W8vuUwVvkZyC1+KTByRbaaoWsxHF/dwi
	CMN0kxfiZlPLk25g9HHsU8P+ouGLOVocZK+U26E3tOT+hiFQB+kCsjw8eOs7NjFA
	MaCRuEq0ZSdlQS5yn9sC2RdTmqcOHJcQNuZpw6zO9tl+kFDdkVjWk9MOdQfrZmeq
	wDyQMmQ5kBjfsexLhvV/0sjpoMdMmp2nCbSWfSeDBgUV7Y6FxUKTO1Q0fmlIRIUn
	QHoW7FABrF9OuvuZDHnYxRipGlCBpbckSbLvi/l6fnoYhwC6e85KrXQE2xs9C/t8
	7hmzzdDA+1cN9wnMZF/q68ACrpEw6nc8+CaDOvu2QExcfw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98j6yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 18:10:32 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd6f09f03aso4451071e0c.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 11:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361432; x=1783966232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Xk/b4HzWXEdWqMLmjiSukHNp9G6v/npFf6Co8X4+FA=;
        b=AYb4OPuKAQNykIP7K0NEWtnlA5kh8Cji23QbSHm6sXfuoNB2dZMuMuQh+nJN9SA9LA
         MD8c9Z0d7NMEoCqFUUhZNDHKzJPG+qylZ2gkKEJX/5S7F5Cx7m1jxbipIQcbLk/0NIdh
         SGVlfO0I5vg3fF0Z2vX4IgaRV3mxn9gN85TqTgl1//luqa83qfb8N/ixQOmjULyxq6VU
         J1cfdFJAw3V/ivjWls3pwqFx58J5MSyTR/p115+u5HmSJngJG/aNmbb7ZIc4/rRlXpaw
         TUpRb5m3OCKYPrWNUbY1yk66g5Uzmzc8x/iCtd0WptGDjd7mR5MuBpsUQHQJZcMoxP8B
         GjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361432; x=1783966232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Xk/b4HzWXEdWqMLmjiSukHNp9G6v/npFf6Co8X4+FA=;
        b=VIKHCJc4k9TsJNYYo5S6caxOBw5HBbz4Q1eTPGKsBPwIk8IYChiLDoly/heZ1PlASG
         Olgin20FkRlOx1RZmK9rNRHxMOLDMlFC10BsJ88ivcyfCQbxZaBhY/oI2cEq38ETuJ68
         14OhDFlG+3qw6e3LyKqD455tklRAFLfLA02VhVITca1jhglHnbfz3XoURQlnbq27pbwt
         LQQpRw0C7n1pCABo5VC84n1qc4AoNAZ6GDD9SN0EohpQ06vXKNmlucHhRmFzdMBTSfCu
         KDOWUMPQznaPYSjPpcNXEawzkMhyDNF5TZjAzcOK/S11f0MnsrLAPNEGUKJsFxahf7dO
         I1Qw==
X-Forwarded-Encrypted: i=1; AHgh+RoRAB+o3EYdC27onghQqGV9hfIZX325T0/JwTYYeZiV/r0M8CNKleiRbsPL6p1T1pyEU/38lx7VlNLY+SzYiS/E@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx/a66LfIU4omTeylbwZ8hISIJ7l3A4F4hebxhbA8+NcDfvVf2
	Bh+lCEHL948P1V3B9sMVf+TWVcUit6C/sf9YCxYRSeVcktcOTX3EGofRH86521LIfi/9gN5mW05
	fxNfCEvVyLfi9Hq76oDTUas8WW3FvuRrVp9BY2AbFNwKd26Z1t33DI7QFbnR73Hy8xNLch9pN
X-Gm-Gg: AfdE7ckmi3B0nTtoX/ZJ3QoCyOF0RyGCoNBwt6+TD3r/FKRhKfJv9av0m/OPOKpnYDD
	6PmcO5f6SWQ6NX8ZAz+giA2bfz5hgTdYgl1CjNXQPwg0vjCYZXbmx82RwygJG086a6etBPuUemN
	uENwoPiRrMCyKY7kcdIXbKaPp9/2bWM1Iq2dT9EZw473hfAudM1kbGpGMK79B7G0e3fuKqZts9c
	PP+LypAcSNFlz7yCXfA3Y0vv0qQvVs3OTZCh9sIcEa0905D6dQbuBNgSS7TVgkeMgSa9qyCfoVC
	qxL1Pk45hskUTRmSIZUBBGPiKQl/NDXFqO0NBL5Jene91YDK9wvnEKkMWUdMbSUQWDYmyx5pH5A
	K69WnUU3D6iW5+ByPRuWMliJAJbxuxUJZQE14Iklmf5+HPzt82KwHS8W+ykUQ0mFYO+S0YMh4ES
	Rft/UyBv4uiLd7Wdc8ZhSE/B2w
X-Received: by 2002:a05:6122:3d4b:b0:5bb:d233:70bd with SMTP id 71dfb90a1353d-5be8974163emr1068019e0c.2.1783361431920;
        Mon, 06 Jul 2026 11:10:31 -0700 (PDT)
X-Received: by 2002:a05:6122:3d4b:b0:5bb:d233:70bd with SMTP id 71dfb90a1353d-5be8974163emr1068009e0c.2.1783361431511;
        Mon, 06 Jul 2026 11:10:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701a7sm3044686e87.12.2026.07.06.11.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:10:29 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:10:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 5/6] remoteproc: qcom: pas: Drop unused dtb_mem_region
 field
Message-ID: <lvncryhxiubp5h2jhuozonhsdcz5ylkseyujmnfezemy2fucy6@hf53qymlogh5>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-6-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430191253.4052025-6-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4bef98 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=PVo76MSw2fuN9WKo6WgA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MyBTYWx0ZWRfX2Dr4wKOgKsGX
 FiCwFVF3vwpZtWVkWeiQ0zeze8FKPqFjlmP6lbrBUG1aywXcc/0yvMHHTAjO3FGqb+srsRb2Ddp
 h6xqlIKZe8rRDuWljtBWGA0PpxuWH0rt1cKWeCZotHLXXPijhaglNWMBxUowEIIFbZ8Y/FjMcDK
 UN9lb13s350SUU7GNRCuRz9RwPV0uZDmurEj424HcnWpPJvejiMd2jUQlawf8txWne4pn3u+qYh
 X46xn1s4NTIkBHy0gMqKLM2SLRX8bQelxLO48K4KJlYb2czCI6FoyB1JCs7pMMppM7J+b16Dxga
 GpTwf+whLaLCAHD3OSfT9/KYPKWtkewNwgZR/N/5botH6Wt4OrK68XFNrcGJEMtTd+4xKuaaa64
 +ouOUdhDde8/ycjSdvL/C+K1HL/0v+SvcV0oWrxReY5F9qhqQ8uNta6lfwKQQsyzivDVbrXFyvE
 a1iy0ibhQdS6d5TiScQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MyBTYWx0ZWRfX18fd+Rwp4BIY
 ii5wcN9xAgrptVfIhnWJ2E3NANTV1/Iz9/f3u47Qde09nFwZIp3cm6xLc+sJJnK/d+bN9lvhRWM
 5JfTsJ7bTP6LUy4tUzN6qZWqeyjkh38=
X-Proofpoint-GUID: bF7y802___G0JD8D6vBREDrRbTYPXGxh
X-Proofpoint-ORIG-GUID: bF7y802___G0JD8D6vBREDrRbTYPXGxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060183

On Fri, May 01, 2026 at 12:42:52AM +0530, Mukesh Ojha wrote:
> dtb_mem_region is no longer referenced after the ioremap was moved
> to respective places where mapping is required. Remove it from
> struct qcom_pas.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
