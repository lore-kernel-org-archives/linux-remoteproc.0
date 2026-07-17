Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AE226FA60
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 08:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278003; cv=none; b=L4FsGROaH4WrpHxFaHE+unH/ZJt+/TcM3n8EAqEou5BckQ3yDQwnOGrmR9g7jxLgoZmqALFFb4wV8g/zCEvsjmzX0izli8sYw/e/5azpCE/FN4dqfBFcqUsdDgzWx16OzqNNjp5zJM7x/1e/DNDXMD/rnXxZd3m1ECyj8WALKtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278003; c=relaxed/simple;
	bh=2Q9Ncwhw0z00w1t4ETnApQ0wQK+b97/w0a9v4ZKSgBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTlvatcoMW5lk0MSkZrng9RolBIEjv+YUGixfKikzvrR3uCvz0FyhohWGofpjiG14DMWHCo3X49VYD18JvnVscq9yihgNcrwEvgIeeRbrNNBdRXUe0b5GNXEobeRanPIdnl5Z4lMVkj4Td9DndfkI/ETpnhzw94aBHCSfwD3Qw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIgaacv8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahWdOycY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIgaacv8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahWdOycY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cZvt851854
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 08:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oXe3C4b9BecGe6h9sGRxybc0
	wMYhUTY5ri4dAfoe7gI=; b=UIgaacv82rId6u5srug1sCraCNyMM0VIOLO0B4pg
	omX+2c22DoKrEuU/lrsbpAM9QISVUiOrRJFEgxDufaJ8g+rC09GG+U0LFRsVdZOH
	wQSguNizZB90uFSJHqVdKQccXY+BdlBJzx4gdhyWFVZR9M74LVdVcpjihTVkVzbA
	kOMucg2iCxJenNEeUInoQzQxQm1Jm6hJIwjXxrVKm+owmLTMWL5DmvZ1e4/8mEd2
	qc3T8x7BfY16BcvGZ8Ma+xAbcaFaP7sxUfwMCrR3AXNy31/ZQF9PhrbkU6NU3tOk
	R4TEpLvX7leBddypYy5DWu0zKDt/KIOVy/aQgpeDdrfRRA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9p8fvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 08:46:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca124bf0189so863712a12.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 01:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277999; x=1784882799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oXe3C4b9BecGe6h9sGRxybc0wMYhUTY5ri4dAfoe7gI=;
        b=ahWdOycYJpW1uWK2WEpkfoi/SdmHbZ9m8HDZuynzt6Lv8V2mw42hgnOnKpFVF+91XJ
         F1eaVTksZbIc7CJJY227hV+hNpPuo86RF7+Y9rwntlk5VimLKENu7cAaX5xFieYYYjs4
         BX0cidZo0XA8ePk/qJZmUadHhakdKzcjPDoaqXurFmco0XJFMyOdDKy3aNSa5fGRx4DB
         Zv5e7ZnyBKye65QJwslLuDqrsd48REzjqm6tEzoDChUGMx9ZYHSDIqHpEVGGEquzrpSH
         wY6gasLR2ET+14fAlIRVsaCuKZVjO2KM3TvTc8AfVcNkiLIMjE8NawxPhr2dWOxlE7u2
         sOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277999; x=1784882799;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXe3C4b9BecGe6h9sGRxybc0wMYhUTY5ri4dAfoe7gI=;
        b=cXhjBHrAjv6f//bvvOalIoy2voRCC8qX2VTmJ44Kq3xTBADbcJwWZLWY9OGkNb5wuj
         cXupfi9HswLgnsMhST5z4nOnmNpRQmc7zRum8RVENFftA1XUq99/emKrnjqh3Z/3gywE
         IdcRzRTHmNLKsV/m6xfSm5I69qIwhHBalxFrBXGAO2rLTixsgzDHW1r1g8al06uwqLcD
         a33bq4uZXkx2Ldhs9pL0B2ysmpJZ1mKeZqB3fMqFp7mM8Q8M4q0wkz/Pksuv5FcIhHR0
         UhWbiKUVgzKWlZWRgN5qsZk9F9c3kblreVKjuwb3yHYfjmL/EFpuCr8TBWYFyhLIj6Rx
         6LsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rozz9YJPWDH6sIB93iChozunXY58zYg6nc60nbOPGdQgubDb3PuiU3B+cJiDAx2W14q2Q2riHMzoNKZnaDfNkrq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzgxe2otGBz9woHXVnYRrS0BHIHZlY9kLMKoElEDYtoe3gMAaw
	bVmwEC8oCJu30XHm3QbA0tOyvHhpgduA9LTcvA1lyqaTFac/8zc9KMmK/D+0fBJLUBamy/IH8m6
	MMVbyPubMhLFWPcVYzIGkrA6hvdhFnvtqH6HM/Inv5ZXZQ0qxf12Skww9rc1rar+ZtlRU642r
X-Gm-Gg: AfdE7cmaQS0Vx7aoNqP0hudHGK4mcaTwvHDxYSqzj7GPjlxB7IULCM5y1ZOyZSze5h2
	CwWI5/VlguKzInMqeF+tya8vbKSOMCg+H9iSk0JwbnGmBYAMjqHFzvgzJCSoi8KVBe9QVAsD1+f
	n8eT5/Z2nBXyDWkJTIrhbDcsWC/vo163cL72j2ekk9UkuV2557pWZefF/Az0JK2/Yv/5wXjWOr2
	jOPqYUSr/0NnjyaIr1Ke33rFlqqI5uwQpXiNu0vvsWp9oaOfZNVMPigupGvJflm8Q3v1cQxj1EI
	no2BnqUWVF6C5aDcc/2zvP+eLb6KkFIzJWfeW//9vb23T+Lae/lv24+fPdxT61NfSF6jMeB4vCW
	FtBRR9JEtUTRK8RFQybBATjy7hb9mpAeAJ95dRWmpVWtilQkjgw==
X-Received: by 2002:a17:90b:3907:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-38e3d175d1emr6357987a91.6.1784277999421;
        Fri, 17 Jul 2026 01:46:39 -0700 (PDT)
X-Received: by 2002:a17:90b:3907:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-38e3d175d1emr6357963a91.6.1784277998919;
        Fri, 17 Jul 2026 01:46:38 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d439sm5778034eec.5.2026.07.17.01.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:46:38 -0700 (PDT)
Date: Fri, 17 Jul 2026 01:46:36 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Message-ID: <alnr7DqzH81DRBFd@hu-anancv-lv.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
 <fe8f8696-d78c-4b80-8fb5-3978178533b7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe8f8696-d78c-4b80-8fb5-3978178533b7@oss.qualcomm.com>
X-Proofpoint-GUID: 1kyDu5MW901iab9at9stHlBOZUAguqp1
X-Proofpoint-ORIG-GUID: 1kyDu5MW901iab9at9stHlBOZUAguqp1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NSBTYWx0ZWRfX6dfv3M6sIQ8i
 Lml85xKG3Oz88CHYtD9MgR7bVwhvQnIaErtUHP6FXknRv0ttGngcuIYvaaCkpel/LnzjkxJAC7o
 Y76gF/HAXGfubXuFKbzJoYIYtcBqxH4TUr3o0lp7DfK8jWGZnkkfXsTb1/fkpgpCOLXw8nwjWVe
 pdfJYObKOfG62V7gJlzvcuq9uvKfPJK9oH6AH139QL1NHr4YcFDjppALTDEDx1EVCKEyKMIkQ/0
 FkwiDuh4MO79xNFs3uU+69/+hTms2sNMCRDUIele5knpn3+jvLPxtsmOpYovbrtBbT3+46ERvhw
 vZx96lUkt9oZnzjzuGyOkRgbKgI4esUUQ87MmoHkpW04jQb+H8VfJahT4ezZ2Tqr0tNepCVEGMA
 BfrM7gtdti1ehQLV9BQfzGHWp5osJ0ptKkbbfJg0x+BAg7xeQho+Bh1XZKyrpsDpWSvqJi7EFWe
 icqD9EL6yA7R2I0UgCA==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a59ebf0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Nhjk29dkmxWQI0xhc9kA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NSBTYWx0ZWRfX2UrUsAldFWN0
 LTcQjQlqDgSkJedkJd6RDVTagdU3PE8bDvHHg371EnMVxF2zMtTPgYydsLGP/4hNVv2gKWwn47c
 P1g7a+jriljK67PJYbvuDXR2JuvmIx8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170085

Hi Konrad,

On Thu, Jul 16, 2026 at 04:49:24PM +0200, Konrad Dybcio wrote:
> On 7/7/26 12:12 PM, Ananthu C V wrote:
> > From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > 
> > The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
> > USB Type-C, battery charging, and various other functions on Qualcomm SoCs.
> > 
> > Add the nodes required to enable SoCCP on Glymur/Mahua SoCs.
> > 
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for the review. However there is a v6 of this series addressing few things
from this v5, and this patch also has changes. Please review the v6 instead.

v6 link: https://lore.kernel.org/all/20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com/

> Konrad

Best,
Ananthu
