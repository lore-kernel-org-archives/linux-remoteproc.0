Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B7D386C03
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 06:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924872; cv=none; b=tMz7/+GRs4vIElsMxBCb25d4z+g7uoIT4mCefJRcYphY7KQfdMjSs9Y/Wct+9bX34ZcjRyVdCiAdicGAopTfT9VVUuPoz3yntZXJH87AdNqTwi0m1yWdNnySNn6C3sbADdo4nXOQvBSZgxe2cC5pkI79GOaqdpDbkq5Sve4DWiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924872; c=relaxed/simple;
	bh=w1EeN7yuKxxX4jk35szs0By6nFu+1JxWUhYfjkQiDbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKxlyl6/cyuZfh/tvwyz+8xQFXOjIUggcxNjDPHtI3tabFA92Rz8awhmQhfC7AJ7UhQpNzfYZuKZTS3qjLFlcUkFh/cGLJdHSowA/sqdewmohU9gq8vrhVrudQi/dRKIsrzHYZ/WPxwR6OAehdVV0fgV2To5RHutKIQAREoUV98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EauNT38i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpMIX/E/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EauNT38i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpMIX/E/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O5KA473353
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 06:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w1EeN7yuKxxX4jk35szs0By6
	nFu+1JxWUhYfjkQiDbI=; b=EauNT38iv+UQBiWNFSTAyMON3D9efrbxEGbGyGYh
	Avcfb0Hwat+wR+hBpyy5MzXS9w8zoZ5gdDVHW1SYs6eloPyuQ4KDLcoLm4yXYoZ3
	t4go4UKfOywBr4wo+xq/0VFNQ+RmZzZUIOC0B6BotLjedi+ucSQ/5NjZDO1ZOMNi
	lBuL9wHhzmauIREJUE44AUGig4fS/TjfghMMqBJM4z/ABaoWiQDqAvu7sUPaFuvw
	ibtg+O+rUw7Ek8az/saZN8M+EG62b6x2IAnEFsTfJJDGfshQjqNjFbZ3z4uF2eTu
	IKWNVcMFzF8uQ6B08C+BUftCYPKzpZBGNa2wGCp98I/nOw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9mv57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 06:41:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so3448665a91.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 12 Jul 2026 23:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924869; x=1784529669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1EeN7yuKxxX4jk35szs0By6nFu+1JxWUhYfjkQiDbI=;
        b=jpMIX/E/RTy54VHIo3Ktc3px8eJzCuhKZKVlUm+9PCy2xrXi019mgQqp6u4UBFPgcl
         +WMG2kD9bQPl3DPtD05F/bmZqA5AQvDTJH6iJuC0L4HyR/fg2jZ2sbwqtsiGqm/A9o2Z
         BK80D5wxoK6+oXa4ps9gTvg2fzNDMcaMmTnHHWaCR+k9t/fGWeyMPls05VwRZ+0QREW1
         P6OHmvgll/O4vZLJSyA4i7ol/QKOuDyTyBFZ9z+ApudtddhXavcZBYH4281DP5Vb6MoZ
         zx7fDZVIZQGmMN+R0tmVwkTOmOBEHiMpWQJiCFoWL4FNsBqWuLyPXV8RuzcA+CtGJA+r
         9uyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924869; x=1784529669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1EeN7yuKxxX4jk35szs0By6nFu+1JxWUhYfjkQiDbI=;
        b=TZ/k7nN7D2zL3bVvuL7kDZ5bH85ta37Qj0uU4ZLaJ7mUWzxLMP2hqOW1zIKS7OE0Ob
         LH6wbCr2YK44lfHapxVNsf8Aqd49TSCIP94qKHsM/aqAo6xX9n9RAbz93HXlZxRh83lb
         4KvxImn59TQL6GoWwSPBUMcYCyiv7O/GHk5NAG1Fc678SCN8LgSQjQq2glBGeMP6mriA
         3kk9JfhwD/lTXq/NokEFg9yd1nO9KtDm5axdDHR0JpNe8mueAxZ/7TANwkUwT6f/OpJ2
         PvQ9xYYhd17YZs2sZ1bWUeKovlG06XYu1Z8e88RedvQNK16doOKLpLghkgvBg+BnFgKk
         98iw==
X-Forwarded-Encrypted: i=1; AHgh+RpILTvZOoCIfhDG+5XjlplOmt5OoiC6yjbvfUegOw2a5fSTtrqCRh0JZhPKVIXncDKPHeBJ+YLiZ/ertScpxx3r@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7hWr2F0uoVw9Is3jB9SEBLW53oPfMQ+nqGQ6cQ3UwHerlG7jn
	4eFPELXqpFiVrXN3WBhVa9sCvlAVZ3IaQGo2NK0PCGGYPghHfTUQmRM4RytMGKD1MwV6N3xla+0
	/EioQG1WwgicVYmdCw5bq9yv0pTK/BCwBnMEWkFSiy6gyqiiahzMKR6+bIHMiKauje9RhPmOd
X-Gm-Gg: AfdE7cn+uOsJIS6U8mPKrG7IQ1TJouAy8+3OtvnLHgGvGHz4sUdAe+7G/J8YX9Ka/aK
	CuU89XKmbLh6JZ3NxvJFH3aLnxIJLnsvrBM4n9qOHFfD+sTL6kjSgRzdAmqkCw88QS8u3maTIfM
	NyVcbWHigmsyqwYgD/0Klc4oFQn345FwVkLgKEmcmhMCLDq8OAeNSsWmFKChbdbEACkh3BUMTvm
	Zw/bKe7AI+ej3UGwZI7wzLjYnCmcepuJSAQRQJNF5Ak+6z6Q69a4M+zsY4o1VOXKOgp/ejwSUyb
	y/qQzM2o7XSgR8HZKRajhJyBOcuBaoFFkQzOrLoFEBY8SzMJ5LATJRabo9asaffaJYxdBhFdDkE
	9u8Ujo/ceKr78E8YjqWRpNhdnwJjuRRfiOTghDpUfINADmtREzWHzrSfsdDP/zqxq66B3H8H7Yg
	uG4mSmZwQlyLrpmVBbBjy9D750SpApjEhzshJg/8RL
X-Received: by 2002:a17:90b:1f8e:b0:38d:eb10:6f01 with SMTP id 98e67ed59e1d1-38deb106f50mr3869020a91.4.1783924869527;
        Sun, 12 Jul 2026 23:41:09 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8e:b0:38d:eb10:6f01 with SMTP id 98e67ed59e1d1-38deb106f50mr3868999a91.4.1783924869097;
        Sun, 12 Jul 2026 23:41:09 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm45465060eec.6.2026.07.12.23.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:41:08 -0700 (PDT)
Date: Mon, 13 Jul 2026 12:11:01 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 0/6] Add new driver for WCSS secure PIL loading
Message-ID: <alSIffOraVCzfboW@hu-varada-blr.qualcomm.com>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
 <e6311e97-0a26-4412-bcf0-d0313bf52c01@oss.qualcomm.com>
 <4a4e0e9c-8541-4fcc-8019-10a576840109@oss.qualcomm.com>
 <alAEKQzBXqjESAbo@baldur>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alAEKQzBXqjESAbo@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NyBTYWx0ZWRfX8cP9zUFRU+WU
 DpcvSUXkUzbbNZsfgIPIn3Oe3ijIsX2G5V6p+OIQhsX8AFZu4nUjhfRIRi/ZnaZI26oZHSTdtQ2
 ebu9XRqjPLC2/wQjxso6LYlENCC/BJ0=
X-Proofpoint-GUID: zx0gtjSOmdIJYFkx2YZw5jvIWywEyFyY
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a548886 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=giEOzCuHGsYyuyZPE6MA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NyBTYWx0ZWRfXy1wDVNcOUW+6
 DiAUZVuV3ER4N6uP19+oRv9SrKsNWuZ3XqQVzzT2fnPzvBOrqjkKM+YdyvqmcA+WsZuwu65FLI4
 mOJiw2a2WW1kxaHFUxEpQ4zL4p7dmCeUNvZwqRLZEx6OW3Qww/Cejph6yUNdbWxmmUa7e+otSB1
 4b+dKy3aa1zUDkSu4i2va+Vi7U76Qw+0puJ1lCq6gfWri0Ur/VLTOQkTqd1QXOOXGOlsSOk6lxA
 1HKG6dG8dzen+5+PG2P+8pjPf7bH17/3ZyQpC5Pg0hS2xakpgEXo/YUl9PqKi1tkJAl+9omRdLw
 eiSqfBJui9A+F+78sxMdO5NBbgPn8HCQJqcgHSiAkylctcPawVw25j/MvZP7ziYehEkwtiYBD1F
 G8qZUQHEIfosrdMAk7qszcK0xX/n4KFN9aH+JlwllVFuZNosH3swrgBsfqgNRcyE9sfROD9PvPI
 MQ8PkR8JW6CTtSwl7rA==
X-Proofpoint-ORIG-GUID: zx0gtjSOmdIJYFkx2YZw5jvIWywEyFyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130067

On Thu, Jul 09, 2026 at 03:31:15PM -0500, Bjorn Andersson wrote:
> On Thu, Jul 09, 2026 at 11:25:17AM +0530, Vignesh Viswanathan wrote:
> > Hi Bjorn,
> >
> > Could you please help review and pick this series if it looks okay to you.
> >
>
> Sorry for not keeping up with this corner of my inbox.
>
> Series looks good, please rebase on the PAS changes that should show up
> in the next linux-next.

Have posted v13 - https://lore.kernel.org/linux-arm-msm/20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com/.
Please review.

Thanks
Varada

[ . . . ]
