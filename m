Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4957741F7EA
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 18:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360985; cv=none; b=k0T1JJGq7RuU+Ma4/9mYQNQLnGeC4tpYvbHi+OdGkx9JLv2kq76n5yrWqDQrq2Aub+buO9eNiofQMY00sgONgR+0QeZ5tvM3wRYw4v2K/r+RVgRjehjHiyIoH+ni8sHvdGdFBjrf/X+4Bpya+Q6ueFnf5cgwANV3xXve5V690p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360985; c=relaxed/simple;
	bh=M5oCKwyIlPq7r/Ou714ZeG/wMj+UdXi2bZRWxkpUj30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOgizD8fttE6k70yQsru3O7Xe/2KtshfK0PtCApdY+m78pHh4U4GtiU72BoBZbHr1BK8kKIsCMLcoxa8p4gB32AIOLKAlcb7otdIG+Jpbuy7KvKRtGU7LmNj+t5/TCZ5orLfLtVs4zyJ04GTWrjKETeKC+rSpqxZ/RcWuIokvwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=er6gkWWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fIW381cV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="er6gkWWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fIW381cV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF54U947310
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 18:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wg8vkZtQ7pGNETfyMWbWWL7/
	TDivSN0s6sicKMDYPCA=; b=er6gkWWuWV7UPpqMguVXgPhaYCavuC9SO1n/q3ad
	g5Zn09yoqILwoLIc/Bj2Lrzf8YzkK6OoSf4NzAvRdTGFoD4hGumPlxjcJ7DcMLq1
	nfQQ3HuiiuTAVge+clUIk5SnAW8u417zHFIl7pRsXLZaGUQscBKEZgJH9hNG7cOT
	MdYORiEguGBHVb9Pq5qnDRmOGrb+PTKz/BNL/xAhdXAY+mKfUybFerDZvYh5zAdC
	7vrJcBheKaGgWTLgfk9QTkYJBNH7Qs0PD0WMhA/jq1iYK0NSzCmQ8iDVVNRHHDBK
	kkjBYVBWKG+x1iIXKRq6fQM3k+MmHSXeIEFqBLDBS9guVA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h52nw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 18:03:02 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bdc4fc26b8so107014e0c.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783360982; x=1783965782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg8vkZtQ7pGNETfyMWbWWL7/TDivSN0s6sicKMDYPCA=;
        b=fIW381cVKzFE47zDqtJ2CnFb2CVGYKjJ/TSV/Da7c3zkmkkPl1lpVYcJnrmq12PSMS
         rHE8qnaQmFPulkni+hcdhVsYSLrGWREz//d8XnrLZJhBsNZdPuAiGT33Z4XSc2R2NZus
         fNBJHNbXmloEcIst31z1W44LynKVo/8rl3n0i8uMq99faKvdDJovN/zqDa8kne0X0FCx
         TLr3iDrrCippUDzXmnt98kHL6QULi7KJyYT7v+1dnJot1INQGtj9AiPL2VAHRYMIIJ9Z
         Ntl6xj/4R1AT9PecjZrp2DfUSz3ro0F3G+3IG9GPTrR5qvohR4rlwUIET4CW3gDDUHHY
         tbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360982; x=1783965782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wg8vkZtQ7pGNETfyMWbWWL7/TDivSN0s6sicKMDYPCA=;
        b=rgwAkXKLYP2WiAjhPYi2EWM07ZGcDdJds/oip/G26sjQo6eRV71pEGt5CT/FEU5gyC
         +dVk5Tj8eSHSfVoeJvSLCB4nQJs/VaWg2pXrQRj7AgBAHcF87vOoMVjMRYJ2Ikrz70ck
         HBlbO6B1yisgYDSJl4QV8v5D0VmVSeLtR3MOIiQEVZq/QVSwQYbT1JfUWWQi+3ymP/e6
         4bhNC4rspuv79eC+w3G+DELSsuV23aAbwKv0sFSn4oQ3/xFSsLlBI2noeJe1UM11IlNd
         KqM3DXYrHbb7csgbujYILb2eQaicIw9M6RHrkPBU0biMZ4xYz8NYf93erYb2EE+rLDlm
         cgUw==
X-Forwarded-Encrypted: i=1; AHgh+RqtuW9Al891Q5NG6iDxA286+f7ekrKODe4A6zWUimDBbco3MGnlbK8EhT7EZcQSbNdlegOy3k6Mg6DVWG/1RIow@vger.kernel.org
X-Gm-Message-State: AOJu0YxaF4nkL6IEl6XjalCuUaDjtYLjDbXUqUchrf7plL0nGr9kIRim
	Upi28A7USYcE6LCQuVw/uSAQcwOWSF5qj2AbGy6L/0DG05QyZQBRZNR+x8qC+yPxWSAbmXQSFYp
	5DiS2/t1YYVbGjYsDJIzheD4guGh/H279Y5ewmkFTMf7IwtnIZfmQNnlNcwB8s4GO05XwOrtT
X-Gm-Gg: AfdE7clfK4maPlgxwB4lX7vuVOaMnExM3Y8eaF11HwAG32rbHhgf9pWGq3pMQc+6JRx
	cXc1x4fcQDF7PWUVzIW1I0oEQY+yMSZgDta58ZmyJ/eJaegTC7ZjWtq06J0iZK1izSFjaUa8R2G
	s73po8qx2fWEXG8wufk1VHebKHqHm7i8Vzqka808kI6AxZT0kcLqHl3w5ol/IPLnoJfNgEYWMOk
	p55IIHyBA/2Wou1auLvYlgOiW6l/+G3l3g+vTkuDu3vEWBENE5Rh+3j1rpGyWatSziWKI9BlaK1
	F4Gpv5UQO+3q6aEydbJ4xDziCpPA8NVE51WZcW6CNDjK87Z4UK0Dm/WmHjy7M+1kjEpkyDwHWx5
	6BB6FFCApmd0Nl47A2oZJM0RTy9LUUBic+AiWRwdh60kgXOtr7yU+MTZh7+A46stRtkoI8ylJ9d
	EBGZRtdJ3lXtJXnndt++3VUF1s
X-Received: by 2002:a05:6122:1696:b0:5a1:b296:78fc with SMTP id 71dfb90a1353d-5be9076a42emr517283e0c.1.1783360982282;
        Mon, 06 Jul 2026 11:03:02 -0700 (PDT)
X-Received: by 2002:a05:6122:1696:b0:5a1:b296:78fc with SMTP id 71dfb90a1353d-5be9076a42emr517264e0c.1.1783360981779;
        Mon, 06 Jul 2026 11:03:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbd1sm3006551e87.44.2026.07.06.11.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:02:58 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:02:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/6] remoteproc: qcom: pas: Fix the PAS context
 creation placement
Message-ID: <ux262i3he5ieqlr34pizq6au6sfihbvkczpgqbt5skhe2um5ld@v4ukyw4w3y4z>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430191253.4052025-4-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: 3Nrt9GpXJqm4iaB6BWX1vxpSGHPV9rUN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX0OcjbGb6/UnQ
 /zrGiAVjelkCPjZ+QFLdnlj0YkJspT0RiC0kjqzxBv2wy0SiWjeAx0tZlY3dfMAwRsNhUrbdSdo
 B/v9livkp0Hdui3/UmbwKDA1WxYUvKg=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bedd6 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=mq4L24Qaxw1z5iCuomcA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX/22PYASVVq3L
 qkxT8E2ycBF/hNT50KumqDBccl4NHdZ5q+gi3RCW+VucYHYDX8fg3tHh0YHdu7lTu7ZqYtIcqFG
 mqlzTaRgCpmqu+dao7LpyeAOzrQhTX42dXYvCzX5s3oOtGRyC+9b7PuyTYjScLApyXlBOIaM4zF
 P9/y+iUIGitO4RuHqBz5AJtGcg3EPMauncsKcAg39GRnPFLyyuEN87OPauyAbXjOe0p2/hGYSf3
 Bx5AmRjidoTDJvh+OSYWOb29RPwM73qQ53OevUSBy3rXdv4RPKFgQWa77DK2Jb7cA9UxnpaPSOI
 H0myEYcUH82MxIAci/HUfGJPxLd0MW6HSL42rmQeFQRhkgSFmWTlOy86sMEwVe4VgzHfIRafxiz
 qwSAy69TSVXkwr8ttOWFTWKVgVqHxKKSGTbneQHXWHv36mW5dCgp5PpxK58WjSD0oEsXYdKFcsF
 DTDoD5ERYoVBC4RjMYg==
X-Proofpoint-ORIG-GUID: 3Nrt9GpXJqm4iaB6BWX1vxpSGHPV9rUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060182

On Fri, May 01, 2026 at 12:42:50AM +0530, Mukesh Ojha wrote:
> DTB PAS context creation should be done only for subsystems that support
> a DTB firmware binary; otherwise, memory is wasted. Move the context
> creation to the appropriate location.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 32 ++++++++++++++----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
