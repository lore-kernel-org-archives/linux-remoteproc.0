Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAB93F871C
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017902; cv=none; b=dHL6RpX1HpUYJjJd9j2dxP9DyEFcB+c+Ex6Ous59J86fhw8OTW7W2OBdaKoi61wtqgKvgLD7eTTxKMf0ULFIRv6EqCEjsOLX7sSpIEV2wRMmNERboQhEJyrNvVNvCsOlIDynGkYKdmgOtYy8eyZlQhTcM1nGiXKHpbvxRteczLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017902; c=relaxed/simple;
	bh=w9RfwcP2qCQa01IxTu9/QU8zyWVnY63wLoObeR76F0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBfNE1FXdOVnLsF/VwLgEEKUJ0mL8h3QMEoz2ZIfRG3RhzqPPJZFgsQTGk8tJ5H8HeY5QKOtontEl5qm+miG7pNNCmfvepuOu1HR9hMCE0Hv1Z0f5nyQJ4sTKa40qjMCgjzEDXGlsEKOdBuF9PoFUDtLxJFztBTSWbdVwv5/SFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=phU4yKOn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8mm2NbvE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="phU4yKOn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8mm2NbvE"
Date: Tue, 14 Jul 2026 10:31:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784017891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fqrW9zYSHaj6Xc9AQwV80EeJsGB55mOhWfKWF07FYTU=;
	b=phU4yKOnD8pqqcRiZ6E0nYyLPEOcH3heyQioklUwQXBxaPLGeiNjLDDexqU7/+O0XtR6uQ
	w29e0HOHkIg/YcBYz25n6ZpE0ucvcs8s1ZH2VbAfr9Xcmh5fsmZ1oiGrHz8/LeQT2ufczW
	8qU0ltK4+bJ5ucrDpuB8D1jCL9Id0iY7opoHWr2PmD0vLYsuBQ7Cqz9IwLZnOUoprVrXgW
	sK7Mku0treHtifQrPJsg0R17yTYK365s/roqrn3Fo9AQtzPzTBLO14wS/FizFcLyi75Lu0
	JSGIcSNpEsTFaXO5SLnDPHXd4iXCiG0UWhtJRU0YeKCKTzx1v7kxrxa12Ly7vw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784017891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fqrW9zYSHaj6Xc9AQwV80EeJsGB55mOhWfKWF07FYTU=;
	b=8mm2NbvEEJ/RjadJo3IVaT2oLIPDQcZiX9mcxVmr5tCdJY3JfJVDDqhY8320AZsCSKmbH3
	5ZCVTPT6WmHs4pCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4] remoteproc: imx_rproc: Invoke the callback directly
Message-ID: <20260714083130.ZsK0SgpX@linutronix.de>
References: <20260703-imx_mbox_rproc-v4-1-67b10560a861@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260703-imx_mbox_rproc-v4-1-67b10560a861@linutronix.de>

On 2026-07-03 10:24:18 [+0200], To imx@lists.linux.dev wrote:
> The imx-mailbox driver moved the callback invocation into the threaded
> IRQ handler. This means the callback is invoked in preemptible context
> and there is no need to schedule the kworker for the
> imx_rproc_notified_idr_cb() invocation.
>=20
> This was tested with the rpmsg-tty driver on imx93.
>=20
> Remove the workqueue handling and invoke the imx_rproc_notified_idr_cb()
> callback directly.
>=20
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

A friendly ping.

> ---
> v3=E2=80=A6v4: https://lore.kernel.org/r/20260617-imx_mbox_rproc-v3-0-779=
48112defc@linutronix.de
>   - The mailbox bits are part of v7.2-rc1. This is just a repost of the
>     imx_rproc driver which is left.
>=20
> v2=E2=80=A6v3: https://lore.kernel.org/r/20260603-imx_mbox_rproc-v2-0-a00=
59dc3b69a@linutronix.de
>   - Forward the error in imx_mu_generic_tx() to the caller (new patch
>     #1)
>   - Extend the patch description a bit for for "Start splitting the IRQ
>     handler" to briefly explain why callbacks are moved to the threaded
>     handler.
>   - Drop imx_mu_con_priv::pending. The primary handler wakes its
>     threaded handler. Once the handler is woken, the pending flag must
>     be set and there is no need to set/ clear it.
>   - Avoid the double clk_disable_unprepare() if
>     devm_mbox_controller_register() fails.
>=20
> v1=E2=80=A6v2: https://lore.kernel.org/r/20260529-imx_mbox_rproc-v1-0-b8f=
fc36e11e5@linutronix.de
>   - Using correct register to enable RXDB event.
>   - Update commit description for the "threaded interrupt", "unmasks the
>     interrupt" =3D> "masks the interrupt event".
>   - Add a shutdown field so that the interrupt does not unmask the
>     interrupt if it has been already disabled because the channel is
>     about to be shutdown.  A possible race mentioned by sashiko.
>   - Use devm_pm_runtime_enable(). This should avoid a possible race
>     sashiko mentioned.
>   - Use devm_of_platform_populate().

Sebastian
