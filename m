Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EE31E5B88
	for <linux-remoteproc@vger.kernel.org>; Tue,  5 Aug 2025 05:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754370040; cv=none; b=oYSDqaWDeNucHaJe9a/XMrQ5uQAyJErve6jmCAJzWJBIUnL5rtaEG/ifIyIo9nYiEE+Hg/S23dHd2taZRacKT3XQfjUWcXRfSTmFViDkToRbilOAUsQcITNQ90eFK3myZt0EKX39jo+5vVsRj+yR1gIkMg2GkZwykcHt6ryJ5Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754370040; c=relaxed/simple;
	bh=cB0RoKbkHD6q1T2SM/hWjHdFiZDsJuQAftQaPgHev7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSOB70VpwlDp4aOxZURn14VxxIbquFJKPIZUf5th1RdGkeie4DyF7wEd/4CsTp4YJf8hrTFnDLROrlXEA3xpSYXuFMaJ8MuZIJP+MrCGd3AjSGQztDvFu5ybAfIj5L/jfz0+LkLb5syZIs1Rkq0ZtttOCMAcu8iyTOEqpckl3+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1VWjBLH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1VWjBLH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574HGSnI020246
	for <linux-remoteproc@vger.kernel.org>; Tue, 5 Aug 2025 05:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0DQgWHooGYbmL/nzLf5H34th
	SEgDO1zfXiTjKuJ41Is=; b=P1VWjBLHIfR1XVuzIzFFwTGt+j4gy0b1caNJDDLJ
	SbTeKxBirtQi3WbViE/SLMPz8qOiU3sW/FxOkW1oaMxqKGEHGguIEPfI38VC94vd
	U/uM9xaPJkrX/ssrML8soZE8NlQlF6kWqZQkZq8HVBSBA52Z2HuallGAHpVuCs6v
	of5f2/zji9mf3K4T7xT2x4hvZP/5TcVeQoPAFEy6rRWuShEE6gR6Bq8Rf9JF2Awr
	xib4dNf9UdYgPT/8tsT0f0knAW3IhEf5GSNtaxWKJnr8Uzyo3HN/FerucZkbS3Ts
	NGPmY9cnNCz6Hc8K/nejkdxPC2DeQu+KoRuuj6eh8Kyn5Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek76w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 05 Aug 2025 05:00:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b06908ccacso39337081cf.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Aug 2025 22:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754370036; x=1754974836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DQgWHooGYbmL/nzLf5H34thSEgDO1zfXiTjKuJ41Is=;
        b=ZokVmBl9Fzb9FaVS9Mxz1aSXKGPM/4B+ZE9Iebm6igkIMmmKYPYEKcySwyTqvCkCEV
         8ujF8OTsWe/c82MlUBMhd13ykhdK5ryqKcdF6Q2z032S8/QmMNXm0goKNj/ixZxZ1x8q
         ALWWIHz+M8Ac2NW0ITToarr9LlafWZLmjuEYmKoqKHPFTB2s4KFQ8Tr7vqSLDf4k59Is
         QpAU/qmVHvnR5dNtH2tNwEhaVfmHqM7yl9a7cfbP4f3BL2SckmbC8djHJks+s8DEWER2
         NhqCqhmAlDUNcZnIpyF1ct7h+J1fLaRHxTiTPEOppDnEZRhQ9o2GQn3R5Xq7y4ZrBSGH
         o2Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUcrXxnW01DpuYAmHF5AlkVoOj6OlNImnBeFcQF6Yy+oy2VpWdPp/JGAp5PVAkFxiV1HiZEYvLNmMuQPm/L8R4D@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8XconYrJXWidKwktsSwl6GgULqzjIhEOAIvs1xkUzvBRn1n6+
	wrJ8MPhEG2IvBq78dUHISVsFsRTEkyARy2mwQmhoIsUBCntxkHNgs6YAFh7RtKF9FF9Z6Bq6YSP
	R0ulyCL+GBGL9rwRz8Ist+pC1aTuQquosQI7dsv9tCU5YAWRTW6G8IXRn72/Ud1xQ9iyw/lGw
X-Gm-Gg: ASbGnctNou+v2GlIdc71jKsWkyLeiBRM7MVB0kHNC3rcwwXHAOvTi9I9pIdq7RoKdgp
	yk/4FnXD+OwuPiWcu9tN/JWMKN/x5FLB7zOUqH5SBOa+nqYmOQZdVgMUiF8121t8+CXfjzIKYRQ
	3VMUvIwr6mznvrWneqfneS/KOaCGoNC7UnIEdj7ZR//ouXE8e5gfCW+Hy8ATNSE67lclNNISYKB
	zV0EF2PUhTHGq16SsW5/Y8fr7T0SGfHZSW3V2dSqiZkX86Dkh1EPVpAKIAbuuYgTs7O4kMdv349
	ypnmimwqzsjCjBMkavFioItXCxDa5assCL8B1bjX+QGmJyg1hll4mWBsWHbmdO9ucPOgn4re+Mi
	K6vThV4XwKsh2LJYYh0kq7iCA6oznImav+7gr8hs8c8ZJuw52bc5v
X-Received: by 2002:ac8:5d91:0:b0:4ab:41a7:852 with SMTP id d75a77b69052e-4af109debe6mr149518791cf.26.1754370036475;
        Mon, 04 Aug 2025 22:00:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqMH2QSkqbkzukFuo9DOhQUO27ugkh1JfZWpneNwe/H+GAHQGLPuQ4NvXpMhqsRUKDJMMqTQ==
X-Received: by 2002:ac8:5d91:0:b0:4ab:41a7:852 with SMTP id d75a77b69052e-4af109debe6mr149518421cf.26.1754370036093;
        Mon, 04 Aug 2025 22:00:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a3243sm1873486e87.55.2025.08.04.22.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 22:00:34 -0700 (PDT)
Date: Tue, 5 Aug 2025 08:00:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] soc: qcom: mdt_loader: Fix check mdt_header_valid()
Message-ID: <wqfapilh4mydzkabt6rvkuwtjoii6wtfhm4jzo7h55cie6ivbo@ytt4xo5l7cwf>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-3-5e74629a2241@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804-mdtloader-changes-v1-3-5e74629a2241@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=68918ff5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=yAIwcYGD20Z8B-JgagEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAzNCBTYWx0ZWRfX2JoNHxvNjvse
 JFS7b98nDw/OmNYK7hvJVIXozob+puohP+JaIqUPYKRIJDBNA2aYoAj57QzQHKdSuS3+BlIpi11
 3kcFYAx6G6OfU/i6/n5EFRSQ9YxpCDNVTZLEtVtu7MdfRLVjVF8DZ30s24Nzx0bYnaF0cwf/70T
 9dBSuMVWSZOmqZ4PL3+eHBF+RivW8UysJ57L2guX/+i+8jUHOYRIH8FM+0KJ1J5ebcdbbwMWMC9
 N8UzFkf5lvN8QXE/YMJ1G+V8zEo03EQui8niYQB8xsqlqhQy4xJNSuXKS+iRRF3q8vriAOhpq/1
 1IWJ3qnyYYnoNmuMd3UWO3/UnTjaHtq0OKX/Z4YYdiwIt3U3vrRrRoJL+LWNp+0X2zvFgNu7fZX
 FF7BVK8C6wrE2cuYpkM1MJwBHTSxHzoSo8oVjIVh6kFg8f+zgXFe7DLncmm/fGfJDt1S5VoY
X-Proofpoint-ORIG-GUID: _AGldmSpM-gXJM-d-9IiVYA0El4J1Qtx
X-Proofpoint-GUID: _AGldmSpM-gXJM-d-9IiVYA0El4J1Qtx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=857 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050034

On Mon, Aug 04, 2025 at 06:11:51PM +0530, Mukesh Ojha wrote:
> Firmware binaries may lack section headers, in which case
> the e_shentsize field in the ELF header can be zero.
> 
> Update mdt_header_valid() to correctly handle this scenario
> by adjusting the validation logic accordingly.
> 
> Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
