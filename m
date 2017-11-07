Return-Path: <j.neuschaefer@gmx.net>
Date: Tue, 7 Nov 2017 19:40:10 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 5/5] samples: Introduce Qualcomm QMI sample client
Message-ID: <20171107184010.3ne5zi6gku7b4fif@latitude>
References: <20171107052042.22569-1-bjorn.andersson@linaro.org>
 <20171107052042.22569-6-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2miejx2o6pytgcrj"
Content-Disposition: inline
In-Reply-To: <20171107052042.22569-6-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>


--2miejx2o6pytgcrj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, some small comments below.

On Mon, Nov 06, 2017 at 09:20:42PM -0800, Bjorn Andersson wrote:
> Introduce a sample driver that register for server notifications and
> spawn clients for each available test service (service 15). The spawned
> clients implements the interface for encoding "ping" and "data" requests
> and decode the responses from the remote.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
[...]
> +/*
> + * ping_pong_store() - ping_pong debugfs file write handler

The function name is ping_write now.

> + * @file:	debugfs file context
> + * @user_buf:	reference to the user data
> + * @count:	number of bytes in @user_buf
> + * @ppos:	offset in @file to write
> + *
> + * Returns @count, or negative errno on failure.
> + *
> + * This function allows user space to send out a ping_pong QMI encoded m=
essage
> + * to the associated remote test service and will return with the result=
 of the
> + * transaction. It serves as an example of how to provide a custom respo=
nse
> + * handler.
> + */
> +static ssize_t ping_write(struct file *file, const char __user *user_buf,
> +			  size_t count, loff_t *ppos)

The data in user_buf is completely ignored, right? Perhaps that's worth
mentioning in the doc comment.

> +{
> +	struct qmi_handle *qmi =3D file->private_data;
> +	struct test_ping_req_msg_v01 req =3D {0};
> +	struct qmi_txn txn;
> +	int ret;
> +
> +	memcpy(req.ping, "ping", sizeof(req.ping));
> +
> +	ret =3D qmi_txn_init(qmi, &txn, NULL, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D qmi_send_request(qmi, NULL, &txn,
> +			       TEST_PING_REQ_MSG_ID_V01,
> +			       TEST_PING_REQ_MAX_MSG_LEN_V01,
> +			       test_ping_req_msg_v01_ei, &req);
> +	if (ret < 0) {
> +		qmi_txn_cancel(&txn);
> +		return ret;
> +	}
> +
> +	ret =3D qmi_txn_wait(&txn, 5 * HZ);
> +	if (ret < 0)
> +		count =3D ret;
> +
> +	return count;
> +}
[...]
> +
> +/*
> + * data_store() - data debugfs file write handler

data_write

> + * @file:	debugfs file context
> + * @user_buf:	reference to the user data
> + * @count:	number of bytes in @user_buf
> + * @ppos:	offset in @file to write
> + *
> + * Returns @count, or negative errno on failure.
> + *
> + * This function allows user space to send out a data QMI encoded messag=
e to
> + * the associated remote test service and will return with the result of=
 the
> + * transaction. It serves as an example of how to have the QMI helpers d=
ecode a
> + * transaction response into a provided object automatically.
> + */
> +static ssize_t data_write(struct file *file, const char __user *user_buf,
> +			  size_t count, loff_t *ppos)



Jonathan Neusch=C3=A4fer

--2miejx2o6pytgcrj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJaAf4CAAoJEAgwRJqO81/baUQQAKNkWHLPR050/unA5Rogxj5f
gRQS8cu0aDyQM7N7FB4jwdRbTo3TYTrNPGfmHXK14Srg99uKA5OTt/LiyPQnoeQ7
9jj+SfoJk+WssNAHKt8qa/JecAuW86xR/0Lvu0Kumf4mAbBPLXhjOgUeI+Wqq71x
r8tzs3GvxZD+fu9NrXP+X0C6fjJCbbh7rvdRwjSWqGNgfRIBZRgguuaK0Ojivyhn
FC3++pj3UqwC9rtX3qkOE7O/RCkhgMgZTr8grbK3MzOBMxaHV2I/Ep8J0Y6RWM/u
s0tZ3QrSD99SaIAuIGHSfmXCiEfVD6m4rlMtNE8krxLDJjm+qXTt1tJcImAV+u4U
EVjeM1HdE7LoB0NevLhJG+mLCEsSjZvv/oichrq9whe1QLdzyVsoqB5MJe1ssmtO
brlhGaMq22viDRozOSqNSE6GlSP3B6IvjV8iVj10M4YJrzcDst92KjAheEzvmp5K
QdvnvbQVbUkeCYDB0I+REqxex86g1hLFBf8yfMFr0k0yLdAxlvN2SkZUxKQtnVfX
u05c5GqtLAr8GlqlWolx7VPHcIbzuH5PjgohemBFRtF0U4ct1H417c306kAtn+nG
lSP38jwWH3AdwNx/I5nm+7eFuy8EbOX77vZRpOwVAA9BLs+skxasC5Zxi+Rl9u8v
/S/gVOJCUyoxp3WT/kg7
=eFFK
-----END PGP SIGNATURE-----

--2miejx2o6pytgcrj--
