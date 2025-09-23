Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F63327A3A
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Sep 2025 13:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758634635; cv=none; b=nNs+/1TXzfCNKcgtDMDk8hy6deCIgvCiup1HbmjnjzO+84kD/7tCAkwPBixnDI/vhWb3A15uR/wILzzPET7mNyegZIyxHbazxtaH3QS+A+3tg7KXImY6XFzHMjw/eihW+XkQSa1ZvI8xw8Z+Lv+K8aNVotHH22x2Csk+pR80/Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758634635; c=relaxed/simple;
	bh=zvHGvQKBYJapST6CV/r0N2vkS7ZLXI5YIDtIr8gQL4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FyRRDDUPtF95ONEdvUE96olH+ECEuGOFyEbL1Dn0iWFWuHlofwPpgiTp/MhQ06k5G5x6qNxTiEFDiMDdhAC1cIqQekiwn7+M15XVy+nGRwKhC4mGG9mzdSXo3BWL0QTATSyQyaM8pvCRw4oR9IhsudwATMkCRMK9COGmD57rV60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XhrPSTys; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XhrPSTys"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8HIDv007754
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Sep 2025 13:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V0/gdAHuFvPjc2WY/tcKVRQAXm8u+8MHfW7f+1g4ghM=; b=XhrPSTys0ozGlVGB
	9vzLpj4nmLa9SOecG5AFVCDl2IUsch8+c/ysZAyr3bHVs7PEcmwMELji6ZfFEHB6
	1VI3ENhxRLGF9Vvi37abJZ6lCZ0ZVu76TSp7LGBShgjgVdq5v/yI7z1OKHrJkelY
	O0v4KNqBfntiBzqT8AVrtM2qVtAG0drLvINPcQPt8DFlPgRdvt/psKQ+ZbNZ6Ukr
	GQE9bBHouJnSDEx1sl7Y/DeSKGHjw/SvpA8EXtqJjy0Ia+1b6izPKyrsEK8OQcKS
	sbEIq+b0OzfVB5SR7V15kfN2Xe8EfvbIBan3BGuqV/SmMgz+ptlidK0uIXUxWHa2
	6jhtFA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98gpkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Sep 2025 13:37:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b554fdd710bso1348980a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Sep 2025 06:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758634624; x=1759239424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V0/gdAHuFvPjc2WY/tcKVRQAXm8u+8MHfW7f+1g4ghM=;
        b=ApURUZvze55wYfCMwgoVCvA4ZxOMsranQIqGVYzPg+rF78I3PRZqmEvfgU+MPxMCxa
         qoQU2mnxllhA1durFXIT/ImfYKSKv87wHF+ZDfItue4PVFxU5CEetCmDxt3tLlUoFd7i
         Fn9/99lMHcUPEDNwtnt6IThvZgPQMy5mi3cbtTeuRbsOCDh9qSKpvS8TwHGnPPDUwwzB
         Uho5Fcr9tlchaJLsehNuFG4V1SrWt6DyQQOxvovDkXlWDVDhElIyQxpnkjp1xFCbl12u
         tMZVN8JglQOcwvs5hEwnveM7uYew5QbDnV7clHGHGtEIAHb3i3OF7ZESgHavKK6R3a9c
         ON/g==
X-Gm-Message-State: AOJu0Yz3ZCvPgWTy22ffyTWgr+sCkcMRlsentQ2Qbs2TAAm1uaM/MtQn
	HFv84L5PRGOnW0t4eFEg8OktZ0T5jIkAxTv0ejiy/Ro/tIJ+smxKUBy0a1HFeGONDRVjDIl7aq4
	yQJpZ+uGyF1p1SHZnKwERQly9n7B5zqkLncng5HfDq9/hL05AJsNxxiCGbcef8VEjY4O9lGf8
X-Gm-Gg: ASbGncsBJ6fRR4TTCHA+T5x1LI1pwYINa02penmitq49YMbNm6IJRUvVhlTB1JlgZpI
	kLpUsdvCneCfGskp3zyZx33PuczJxvqaVaM6oJS3/LbEjHcICTh/PChh863yxq9g4qz/vDR4nIq
	6JDaXJwvWMYsgLQ7b1qu2JRSIv/7+V8JZxx/2/b/07lojPNHNbYjqNWG3hVXIJFJhzgmQVj6wRt
	ImdrB728xZO6Gg2JCu8bZ1/l7VhJqyHMNsTzD6nWJC7GxLkysx3X2cG8ZmbTZeAXH6OocPUK91b
	mnfjUGYMRlnCp9T/W/5uWfIb2yTaYghf6z2iLvsUUjPLxGi4eezeW1yqp2eWHcoRuB4RahzKTj6
	jwVCgXMxNpsY7hB5BBjQC6dXkORYTa8o=
X-Received: by 2002:a05:6a20:939f:b0:249:824c:c620 with SMTP id adf61e73a8af0-2cffedc70bdmr3905425637.57.1758634624436;
        Tue, 23 Sep 2025 06:37:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv/R1oyJuEtuF7RPJLpNTrpa/RuVsTep4aUXBnh0RxbTPdowPzbrHSsK6+1YWt3ED91uRloQ==
X-Received: by 2002:a05:6a20:939f:b0:249:824c:c620 with SMTP id adf61e73a8af0-2cffedc70bdmr3905390637.57.1758634624018;
        Tue, 23 Sep 2025 06:37:04 -0700 (PDT)
Received: from [10.133.33.135] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f286119f4sm7814711b3a.74.2025.09.23.06.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 06:37:03 -0700 (PDT)
Message-ID: <3e9c7cda-5a73-4d98-b394-581baf144dff@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 21:36:59 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: pru: Fix potential NULL pointer
 dereference in pru_rproc_set_ctable()
To: Zhen Ni <zhen.ni@easystack.cn>, andersson@kernel.org,
        mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, stable@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20250923083848.1147347-1-zhen.ni@easystack.cn>
 <20250923112109.1165126-1-zhen.ni@easystack.cn>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20250923112109.1165126-1-zhen.ni@easystack.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dDWjyBMWsa-E7j-svdrsvHI_YXixeMWq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXx4o8KhhYHQk7
 o7VTUwEtu76pPuwk932FpJ75aXrJsptQEFjRhMEJttSVfP0iqEBvBIZIBJZE0BiOdfRPV9VbQ1a
 MkQtKj5hOrPzyh+GpAKheBtA5KQJmgPGWR+MqzgocMqP1+oIxe+d03APV3sqwxyosT8LjDJIGRl
 P8dKR3H6p7xKagmeSweiUEyg6se6l571AsdOVlVfIygv8vEofPvfA1oeSqjMvPIAetnps7d166Q
 ThobVx2YM1Ao/2b9TUeGnQgYuKvZmQlnVEpyxLSlw04Ly7cQgSy8Mp3I/TglRIbLbdKH7oauumQ
 XJaX3SamEyRpyuU6B+CHZR7D+1RksBo26XFOi40Av38tLIozC+tcoQhlFGzK2iuSkIpkrKPICXk
 ElQL/tph
X-Proofpoint-ORIG-GUID: dDWjyBMWsa-E7j-svdrsvHI_YXixeMWq
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d2a281 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=BLr15FpE7PLhzqKsQ1oA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On 9/23/2025 7:21 PM, Zhen Ni wrote:
> pru_rproc_set_ctable() accessed rproc->priv before the IS_ERR_OR_NULL
> check, which could lead to a null pointer dereference. Move the pru
> assignment, ensuring we never dereference a NULL rproc pointer.
> 
> Fixes: 102853400321 ("remoteproc: pru: Add pru_rproc_set_ctable() function")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
> ---
> v2:
> - Changed "null" to "NULL"
> - Added " pru:" prefix
   - Link to v1: 
https://lore.kernel.org/all/20250923083848.1147347-1-zhen.ni@easystack.cn/

> ---
>   drivers/remoteproc/pru_rproc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 842e4b6cc5f9..5e3eb7b86a0e 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -340,7 +340,7 @@ EXPORT_SYMBOL_GPL(pru_rproc_put);
>    */
>   int pru_rproc_set_ctable(struct rproc *rproc, enum pru_ctable_idx c, u32 addr)
>   {
> -	struct pru_rproc *pru = rproc->priv;
> +	struct pru_rproc *pru;
>   	unsigned int reg;
>   	u32 mask, set;
>   	u16 idx;
> @@ -352,6 +352,7 @@ int pru_rproc_set_ctable(struct rproc *rproc, enum pru_ctable_idx c, u32 addr)
>   	if (!rproc->dev.parent || !is_pru_rproc(rproc->dev.parent))
>   		return -ENODEV;
>   
> +	pru = rproc->priv;
>   	/* pointer is 16 bit and index is 8-bit so mask out the rest */
>   	idx_mask = (c >= PRU_C28) ? 0xFFFF : 0xFF;
>   


-- 
Thx and BRs,
Zhongqiu Han
