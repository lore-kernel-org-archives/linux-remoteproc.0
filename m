Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D26E15B963
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 Aug 2024 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724057290; cv=none; b=tmlneAtSa8U/1/3pmA2q2CeEpHcOwmNWKcFDJokWHiKroVxRsFglekMIE3KwB7aZWNtWqBC4cNMeT1uws0lKYgaSIqY0tU/hE0r46TmtajYI1H/J0IAmJnIZcKFKgXxwKzecJKNwv3VhNM+wn+r7/ZCoq03c/q2Lb7eVMsm3yQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724057290; c=relaxed/simple;
	bh=BSkKis5oOZ7Fh2LZp6nHL5fBnnTe7iryVmW2oUQ2/+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ca6XnaMZ2cPnTwYsinCKk3oKqrZPCpy+V0bxSDauSV3ipd2uV4KnYeXiUovM6LcJ+M8mkPgnI840rH0mzkDh1jht1udW17k+TMhmyDJBUxxPh4hLUiu0JjDLD+Kta2DaJdfTxoaSCoWtRKRfUIKKZonuUH9/SqxAgP2UrU07dKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=OTaYNlNX; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="OTaYNlNX"
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1724057286; x=1726649286;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BSkKis5oOZ7Fh2LZp6nHL5fBnnTe7iryVmW2oUQ2/+4=;
	b=OTaYNlNX/ib3f/KI6b+gA2gIP+sddGEShRW1PWU80SZ77eiTfF+FtPgHe1tc2uC0
	WWRWhc9IF4Ts4jsY9DSCqZQEOKgcRVY2Amwk4V645sEnkJ/gUWcec8PpEwjEAtkC
	1wTfgCXFGSkLb9vl/RraMJR+Y6xW0Lkkt6UzgdDFZRo=;
X-AuditID: ac14000a-03251700000021bc-3b-66c306c60a02
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id FF.47.08636.6C603C66; Mon, 19 Aug 2024 10:48:06 +0200 (CEST)
Received: from [172.25.39.28] (172.25.0.11) by Berlix.phytec.de (172.25.0.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 19 Aug
 2024 10:48:04 +0200
Message-ID: <ceda3880-9dad-4d4a-aed5-19837a684f70@phytec.de>
Date: Mon, 19 Aug 2024 10:48:03 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/9] arm64: dts: ti: k3-am62: Add M4F remoteproc node
To: Andrew Davis <afd@ti.com>, Bjorn Andersson <andersson@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Hari
 Nagalla <hnagalla@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240802152109.137243-1-afd@ti.com>
 <20240802152109.137243-5-afd@ti.com>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <20240802152109.137243-5-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsWyRpKBR/cY2+E0g6XNYhbvT01kt9jWYWOx
	Zu85Jov5R86xWmw/0MlusfzzbHaLl7PusVlsenyN1eLyrjlsFs3nlSy27jnAZPHmx1kmi7v3
	TrBY/N+zg93i/9kP7A78HptWdbJ53Lm2h81j85J6j/6/Bh7Hb2xn8vi8SS6ALYrLJiU1J7Ms
	tUjfLoErY9+um+wFT7krLpzZyt7AuImzi5GTQ0LAROJQ/3YmEFtIYAmTxKV3PhD2XUaJa7d0
	QGxeARuJFTfa2EBsFgFVieWb9zBCxAUlTs58wgJiiwrIS9y/NYMdxBYW8JX4uHIlUJyLQ0Rg
	GrPE2ZlT2EAcZoE+RonuiR9YITaESzy6PB1sM7OAuMStJ/PBbDYBdYk7G74B1XBwcAoYSqz/
	ZwZRYiGx+M1BdghbXmL72znMEGPkJV5cWs4C8Yy8xLRzr5kh7FCJI5tWM01gFJ6F5NZZSLbN
	QjJ2FpKxCxhZVjEK5WYmZ6cWZWbrFWRUlqQm66WkbmIERaQIA9cOxr45HocYmTgYDzFKcDAr
	ifB2vzyYJsSbklhZlVqUH19UmpNafIhRmoNFSZx3dUdwqpBAemJJanZqakFqEUyWiYNTqoGx
	YHeVfUT4pweJDq83dIetTyyaJOA6y8a3ofbW4QLnOes8jzcLn/+0+npzz0KlvwpiU+0PKccs
	jEkS+bzRU35mwNOlGk7lR/SZ752tyzSYUB2mm39rq6K/yDz9LQ875y63VIj+rxrVud9B++x6
	P4nVQpq5An/u6QtG3Zrkb//62qeUuAenfkxQYinOSDTUYi4qTgQAUiDOT7YCAAA=



Am 02.08.24 um 17:21 schrieb Andrew Davis:
> From: Hari Nagalla <hnagalla@ti.com>
> 
> The AM62x SoCs of the TI K3 family have a Cortex M4F core in the MCU
> domain. This core can be used by non safety applications as a remote
> processor. When used as a remote processor with virtio/rpmessage IPC,
> two carveout reserved memory nodes are needed.
> 
> Disable by default as this node is not complete until mailbox data
> is provided in the board level DT.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Wadim Egorov <w.egorov@phytec.de>

> ---
>   arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
> index e66d486ef1f21..7f6f0007e8e81 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
> @@ -173,4 +173,17 @@ mcu_mcan1: can@4e18000 {
>   		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
>   		status = "disabled";
>   	};
> +
> +	mcu_m4fss: m4fss@5000000 {
> +		compatible = "ti,am64-m4fss";
> +		reg = <0x00 0x5000000 0x00 0x30000>,
> +		      <0x00 0x5040000 0x00 0x10000>;
> +		reg-names = "iram", "dram";
> +		resets = <&k3_reset 9 1>;
> +		firmware-name = "am62-mcu-m4f0_0-fw";
> +		ti,sci = <&dmsc>;
> +		ti,sci-dev-id = <9>;
> +		ti,sci-proc-ids = <0x18 0xff>;
> +		status = "disabled";
> +	};
>   };

