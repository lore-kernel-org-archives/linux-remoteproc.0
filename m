Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80D928E7;
	Mon, 20 May 2024 15:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716217319; cv=none; b=FFJAfb5myIP8Ixf9c2NafY4sIEIGAPl5MRSM5UZ48HjpZX+mWwhbFMpEYjIpWiH/ts1P8r+p6Ya56hVDuJrE28KVHYmFzjxPg+O3vvqyuQgB1k07XOqNfJPmhpoFmBfK3i0h0y48Olyo6MLD2HOVjGFMBybB3NkCATU9JmmqNlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716217319; c=relaxed/simple;
	bh=yZe8BUauvo3lejvk2C+hLkZ78XaAKCpDBbZUCxqKy8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=imOSlKDJTnBRV8izNwqf4sWUggUZ+Hi6trhWSw47kFOkMiyum2U1FpeekmVHL+vuLsb5I0F74sYSqTYHP2c4iZ594psV7knAtyoDT6mzUtbFYIQDvPsuR3v5kPtojvHUZxyw+AZQF6FjnrGFMM5Nhk0/paytwtW4VMAimZVAPCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KHzDrnPS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KHzDrnPS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KCAjP9029799;
	Mon, 20 May 2024 15:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ViWFnlRfa6HfsCpt9sNPud6U2bBS5mkJbqnxes4Nv44=; b=KH
	zDrnPS1fdfel7KxCI9YWLJcFc0omE4hPzN51YzAyvtF8H5eJjOOx5MAZiWV3kDR6
	nHGCtoJ4w5zdWfkijZpbcYZr/YeHui7gsMfIHDRMEZ6O366kEhiLoTNKLvkLvfC1
	w5pEo/5Bz3A16Df819O08VcmWtQMpFSwy2S//XpEsNJAOVjB9snSFAjsVdA13wTs
	WVUEpNn0F8FDv0nvRWsBQdWEncLfX8BK2FtYGiKKxpkZDx6O/7sDpUXNiJJn+950
	qshmrVa7sRv1cTq8eU4tFzdA2ee9xfy93ozB8Gg06WZ1wMRe9faa3BxnZ4HuNvVz
	/+/KURVGk03kcLvRRpsQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6psauk5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 15:01:44 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44KF1hue032086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 15:01:43 GMT
Received: from [10.216.60.210] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 08:01:39 -0700
Message-ID: <7ab7636c-9da0-8053-a264-6031c416ab6b@quicinc.com>
Date: Mon, 20 May 2024 20:31:35 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] remoteproc: mediatek: Zero out only remaining bytes of
 IPI buffer
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        <mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <matthias.bgg@gmail.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <kernel@collabora.com>
References: <20240520112724.139945-1-angelogioacchino.delregno@collabora.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20240520112724.139945-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Bd0pJb3d-7DgY5dqmoJk8-rBGLOCNNDJ
X-Proofpoint-ORIG-GUID: Bd0pJb3d-7DgY5dqmoJk8-rBGLOCNNDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_05,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200120



On 5/20/2024 4:57 PM, AngeloGioacchino Del Regno wrote:
> In scp_ipi_handler(), instead of zeroing out the entire shared
> buffer, which may be as large as 600 bytes, overwrite it with the
> received data, then zero out only the remaining bytes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/remoteproc/mtk_scp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e5214d43181e..dc70cf7db44d 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -117,8 +117,8 @@ static void scp_ipi_handler(struct mtk_scp *scp)
>   		return;
>   	}
>   
> -	memset(scp->share_buf, 0, scp_sizes->ipi_share_buffer_size);
>   	memcpy_fromio(scp->share_buf, &rcv_obj->share_buf, len);
> +	memset(&scp->share_buf[len], 0, scp_sizes->ipi_share_buffer_size - len);

Although, it does not make any difference apart from a write of len 
bytes, still a good improvement to do ..

Acked-by: Mukesh Ojha <quic_mojha@quicinc.com>

-Mukesh

>   	handler(scp->share_buf, len, ipi_desc[id].priv);
>   	scp_ipi_unlock(scp, id);
>   
