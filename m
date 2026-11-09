Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236736;
	b=HLqg4oHfMn+UT4iwquN2SCXJvDyq02h8zYiaLnQd1K8I36S2DnkTUF7UuDhY5pGlIpSu
	 BNLKbY76xb5c59YeUtT8pwzqOX88u6Pr/7IRmoKPS/cdcX5YLjJyMDojtbAOYwCqBK6lL
	 olx2/dF9rVc2X9SC+2vlUtkLBtQzn+yA715iJ1xa+s6Q3qUPQFX+nxl5nkMLUUNJyvkHz
	 VualVJlAfGjQlKwrXQF5/JKZ1uAD6HOX7KgDzLD1Q2kOxWBnBBWzt2iJlwjEkd161gEhf
	 9ulKkufZQlI6q+VI8fBLqk8VbpWSAzjgoKiS4DrC2uubgHCY3ZvRk4xpGzoxbzGVUqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bm4n8PR4Zol2r2UflU7BTBKbLsaJuu5hjO5epKs7b7I=;
	b=y5mq+iMw91FYy6FdD/vAJcUDZABs+ccgPduCJGltKkq8U3xPC9X5I/OoR7uBvDDdLpSw
	 DAAgJJIZ55BZhe15y/oi88r329+ekYlEm0/9TI+a9CrBD0zEdsHbsAoWjPElQ9VgkxkGD
	 ExLq024sgTqh5EtxuGHeQMgscV94bgRrrcaw5482pq+q7oMV4JWPQG0swoJlBBkAdO0Q/
	 jlFU3eSK7mpd1cKPWHXyRbVF9atwJ/gZkccsyQis9Io7yfrNnftS0WIUGNuVdpwxsRL4w
	 Aiww87JI6SJx2E73vkBIDKRhcmnO8KnK1rNbJLk70xE6R/fM01DReS3DYlCtnRoTn7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="yN8/eHBt";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02558606A322
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 15:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02558606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yN8/eHBt
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc758830601so567924a12.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2026 07:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794236735; x=1794841535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bm4n8PR4Zol2r2UflU7BTBKbLsaJuu5hjO5epKs7b7I=;
        b=yN8/eHBtFUZSIk36y9X8io9EEFQsVcyLgUpXMZ2OA5iZkku/XLPHO5HhSUcwUSye+U
         zPMz2QbINcFoWF2T0uSx2o1gj3h77oP9a0nDzhwxC/X6VwCBPPMSa+tQSOkSUbaTm6XK
         fxu2r0F5Ne7Z6lVM8K+ykH5J9MEoLzEUiTstRj7LH86Kgo69L2ZzXcPXH2miPwqHUOFS
         8sJjON2PmfHu1MFlXiXzWfQc/8gJL48vPozdUfO9sLtjBsGWQkxWBgs8PMsJIviUznMX
         6J5fPn/KG8p06ohHuqcBrmQgWdTFAsrxLtmfN4pQWNRanpsaMGMMBjpbwVMHGZ7GIliH
         53gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236735; x=1794841535;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bm4n8PR4Zol2r2UflU7BTBKbLsaJuu5hjO5epKs7b7I=;
        b=qv6+w8EupBkzULpGfiXfUt1VXujFPKEvpS/I9Ue1cjY0u4/9TB5Qwc4h6wF3kAzym6
         7CwriXYtzhT2Gder3HpcSbOGmMiI7UyKLL+labPcef0/7DdTnOZZuaL4c+ObPCoRfmG/
         hwJlyNmF/KRey2bX65OZVhTHEf3/MoYpEsUuCTdEJ7qiwrqP4WhVX9HcwnJhuGcEGpf8
         G3GpAc2hSwv0INW3uT4+IAsknt0VLTMYagUhA48FI2fZqtgeO3MaRDfwSQ4vbvrDzvg4
         PJN8XU8fAh/kiEwiJ3CZqBMw7l0IcFfWqkIbE5MiRasFe/Fi0AiW17/w7LlBDKcQr/j0
         X3/w==
X-Forwarded-Encrypted: i=1; AL+hErEjy2KyWt0PteN+37JjMoAhoPaCUhfRSY7X+twTgT6B5EG+yb0NTCLYSxnbklkpFIG30GN+FuViqC73cGMRQhXS@vger.kernel.org
X-Gm-Message-State: APuU4Z83iGRiUUUZjoFqjb0Kj3FCzm/Wxus2igzzNjTN/9U+6b+RgFUb
	I4yz5mwkFU0hE7eEW3Seq3L0epRmgKQTLnDoZkvFrQ+RYfecdLT2mEhgh0ZDIUQOvmpsunhFVmb
	27jBv
X-Gm-Gg: AYBFou2AyBNx1Hcvp7Vt6Tlxc81ayM8V4wnWHLu2735ShcNDshsrWNUmHH1jDjAfutK
	ESB7rw3rEOZtO14Gb6X30uh+9wmOYoulSkP7+iuiB8vZ8s9I2cuBE142+WUiYrDWOPfupwfkZ2y
	Xc/ZE5CnCR4Jo0C5fgfUn2WfeaLyj0r5wnaWoJWC3nwasvhAFh+ZLrpSt/KpC4CeSdsTs2xmMtP
	kltWG3GAKMrzgy1l+bVul+BxdTSdn/Xf9JMQ4aZ8uIhEvsfGTBSri82ZnaHsok3fzft3nVBlz8V
	ZXkYDfTLrXwKVLyyzYbK1a6hSK5nGhU1dfMNc8cdYkSydEcUljkdP071/SnTyaiRoaZp7RD2orG
	2KWuXVTDdiFVyNmJC9rLk5f3VFgAr42zqxHae0kkO6igdtUG4pgxkiqsS+0W0E/hn2mCnDrCIgm
	yvdNNJLlOx0DMhwMm3+xcUkYPxBid24DfO8UeWi7bxsGePfmyo/PK2XUUY9gZsOPiOwBDTVn7fs
	cZNQ5L0OsLUeTUB6nXOwlvPMFMdRZIIH0fpLDxPrN3FZiUkO2lrxEURjtIvrYPF9DZuS+ofZe94
	AAa6fFwJXdtbrgQ4rbL9po4tUFyISg==
X-Received: by 2002:a17:90b:4a09:b0:3b0:78c8:d56e with SMTP id 98e67ed59e1d1-3b12d441cbdmr4126098a91.27.1794236735128;
        Mon, 09 Nov 2026 07:05:35 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864390sm11249661a91.6.2026.11.09.07.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:05:34 -0800 (PST)
Date: Mon, 9 Nov 2026 09:05:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] rpmsg: virtio: Reject a message shorter than its
 header
Message-ID: <avHhPI5btZcuhKsZ@p14s>
References: <20261106232322.1093165-1-lian@is.s.u-tokyo.ac.jp>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106232322.1093165-1-lian@is.s.u-tokyo.ac.jp>

On Sat, Nov 07, 2026 at 08:23:22AM +0900, Lianjie Wang wrote:
> rpmsg_recv_single() checks the msg_len field of a message header against
> the used length with an unsigned subtraction, so every msg_len passes
> the check with a used length shorter than the header. The rx callback of
> the destination endpoint can receive a message of up to 65535 bytes,
> longer than the default receive buffer of 512 bytes, so rpmsg_char can
> copy the whole message into an skb and read past the buffer:
> 
>   BUG: KASAN: slab-out-of-bounds in rpmsg_ept_cb+0x4d/0xb0
>   Read of size 65535 at addr ffff888002484010 by task rpmsg_echo/140
>   Call Trace:
>    rpmsg_ept_cb+0x4d/0xb0
>    rpmsg_recv_done+0x29f/0x840
>    vring_interrupt+0x32a/0x540
>    vp_interrupt+0x146/0x180
> 
> Compare the sum of the header size and msg_len with the used length, so
> no subtraction wraps.
> 
> This patch is assisted by Claude Opus 5.5.
> 
> Fixes: 9648224e564a ("rpmsg: validate incoming message length before propagating")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
> ---
> v2:
> - Leave the check after the dynamic_hex_dump statement.
> v1: https://lore.kernel.org/all/20261102221504.175116-1-lian@is.s.u-tokyo.ac.jp/
> 
>  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 23ff6c8b7a20b..3d58bb19e9297 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -676,7 +676,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  	 * the reported payload length.
>  	 */
>  	if (len > vrp->rx_buf_size ||
> -	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
> +	    sizeof(struct rpmsg_hdr) + msg_len > len) {

Applied.

Thanks,
Mathieu

>  		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
>  		return -EINVAL;
>  	}
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.56.0
> 
