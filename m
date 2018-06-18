Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36385 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751560AbeFRMhp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jun 2018 08:37:45 -0400
Subject: Re: [PATCH v1 1/2] imx-rproc: dt: provide new remote-nodes option
References: <20180615115731.18424-1-o.rempel@pengutronix.de>
 <6888c986-1e6b-81dd-fb3a-e27218b1785a@st.com>
 <20180615163733.4bmpuag5dbzdqw2n@pengutronix.de>
 <e3401c25-986e-96b8-e782-a5c57122d0a7@st.com>
From: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <f7143423-a085-57e1-dc95-fef665cb5f82@pengutronix.de>
Date: Mon, 18 Jun 2018 14:37:34 +0200
MIME-Version: 1.0
In-Reply-To: <e3401c25-986e-96b8-e782-a5c57122d0a7@st.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GElZvHPp20s27ufJcq0snJKId6gxPK6AF"
Sender: linux-remoteproc-owner@vger.kernel.org
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, kernel@pengutronix.de, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>, Fabien DESSENNE <fabien.dessenne@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GElZvHPp20s27ufJcq0snJKId6gxPK6AF
Content-Type: multipart/mixed; boundary="L3GsHI1MGrzj6pHfmfdEqyxmsqkB7OtCa";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 "A.s. Dong" <aisheng.dong@nxp.com>, kernel@pengutronix.de,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 dl-linux-imx <linux-imx@nxp.com>, Fabien DESSENNE <fabien.dessenne@st.com>
Message-ID: <f7143423-a085-57e1-dc95-fef665cb5f82@pengutronix.de>
Subject: Re: [PATCH v1 1/2] imx-rproc: dt: provide new remote-nodes option
References: <20180615115731.18424-1-o.rempel@pengutronix.de>
 <6888c986-1e6b-81dd-fb3a-e27218b1785a@st.com>
 <20180615163733.4bmpuag5dbzdqw2n@pengutronix.de>
 <e3401c25-986e-96b8-e782-a5c57122d0a7@st.com>
In-Reply-To: <e3401c25-986e-96b8-e782-a5c57122d0a7@st.com>

--L3GsHI1MGrzj6pHfmfdEqyxmsqkB7OtCa
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Arnaud,

On 18.06.2018 11:32, Arnaud Pouliquen wrote:
> Hi Oleksij,
>=20
> On 06/15/2018 06:37 PM, Oleksij Rempel wrote:
>> Hi Arnaud,
>>
>> On Fri, Jun 15, 2018 at 03:21:19PM +0200, Arnaud Pouliquen wrote:
>>> Hi Oleksij,
>>>
>>> Nice to see that we have the same needs.
>>> We push several month ago an RFC based on something similar but i hop=
e
>>> more generic...
>>> could you have a look?
>>>
>>> https://www.spinics.net/lists/linux-remoteproc/msg01823.html
>>
>> I took a look at dt binding.
>> It would be really better to not redefine device nodes again.
>> DT is providing HW description and if it is still the same IP core
>> then most probably it is still the same from all CPUs. Most probably
>> there is different interrupt controller and memory offset, but all oth=
er
>> parts should be the same.
>> In long term it would be great to reduce duplicated information which =
is
>> needed to added system developer.
> This is a valid point. We are also thinking about this. But just
> disabling a peripheral that is used seems also not logic from our point=

> of view.

Right now I don't see any thing bad on disabling it. For master CPU it
is indeed disabled and should not be accesable. What is your
argumentation about this?

> Furthermore how to you manage followings use cases:
> - peripheral clock is not the same for master and remote processor
> =3D> you potentially need to redefine the clocks

IMO, not devicetree specific discussion

> - clock, regulator or pin are not managed by the Linux if peripheral is=

> assigned to the remote processor, but controlled by the remote processo=
r
> directly (isolation, protection on shared resource access...).
> =3D> In this case we must not handle the resource in Linux.

IMO, not devicetree specific discussion

> - Need a specific management of a peripheral, due to secure, isolation,=

> or any other reason related to the platform.
> =3D> specific driver that can be bind as srm child (platform srm_dev).

IMO, not devicetree specific discussion

> To sum-up. We name shared (or system) resources every resources that
> have to be shared between the master and the remote processor. The list=

> of these resources depends on the platform (and on peripheral of a
> platform). That's why we decide to redefine the node.

sorry, i can't follow here. I don't claim to replace your solution,
especially if you have working code I would be happy to take it over ASAP=
=2E

> In fact the good solution could be in the middle of this both design
> solutions. Means choice between redefining the node properties or just
> provide an handle to the soc one. For this we are thinking about a
> phandle to the soc node.
> something like ("parent-device" naming is just for the example)
> 	m4_uart1 {
> 		assigned-clock-rates =3D <240000000>;
> 		parent-device =3D { &uart1};
> 	};
>=20
> Another advantage of a phandle would be to be able to check that the
> device is disabled on Linux side and could offer the possibility to
> switch the peripheral between master and slave during the runtime.

Is it a workaround for a system without devicetree overlay?
I don't see why we should provide extra container for not really extra
information. Or do I miss something?

> To finish, an additional information: We are implementing on top of SRM=

> a dynamic part based on rpmsg that allows to reconfigure the shared
> resource to allows for instance to:
> - change the clock rate
> - change pin states
> - change regulator constraints
> According to first discussion with Bjorn, we need to share this part
> also to present the global picture ,we would like to propose.

Ok, so it looks like we are working on same thing. And you probably
already have most of the code to make this work. Did you made Linux
implementation only for Master or both (Master and Slave) parts?

>>
>>> Could be nice if we could find a generic solution...
>>
>> I would be happy to have generic solution.=20
>=20
> Our solution is a base for discussion. If several companies are
> interested in, any feedback and contributions to have a generic solutio=
n
> is welcome.
> And of course we need the approval of the maintainers on the design.

i'm sure, every thing will be OK ;)

>>
>>> Best Regards
>>> Arnaud
>>>
>>> On 06/15/2018 01:57 PM, Oleksij Rempel wrote:
>>>> On AMP systems we need to make sure that some device
>>>> nodes are not used by main system and reserved for
>>>> external system. Some of configuration should be
>>>> maintained by main system. For example clocks and pins.
>>>>
>>>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>>>> ---
>>>>  .../devicetree/bindings/remoteproc/imx-rproc.txt    | 13 ++++++++++=
+++
>>>>  1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/imx-rproc.=
txt b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
>>>> index fbcefd965dc4..40bec03e094c 100644
>>>> --- a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
>>>> +++ b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
>>>> @@ -15,6 +15,7 @@ Required properties:
>>>>  Optional properties:
>>>>  - memory-region		list of phandels to the reserved memory regions.
>>>>  			(See: ../reserved-memory/reserved-memory.txt)
>>>> +- remote-nodes		list of device node phandels used by remote system.=

>>>> =20
>>>>  Example:
>>>>  	m4_reserved_sysmem1: cm4@80000000 {
>>>> @@ -25,9 +26,21 @@ Example:
>>>>  		reg =3D <0x81000000 0x80000>;
>>>>  	};
>>>> =20
>>>> +	/* node reserved for rproc */
>>>> +	&uart1 {
>>>> +		assigned-clock-rates =3D <240000000>;
>>>> +		status =3D "disabled";
>>>> +	};
>>>> +
>>>> +	&gpt2 {
>>>> +		assigned-clock-rates =3D <24000000>;
>>>> +		status =3D "disabled";
>>>> +	};
>>>> +
>>>>  	imx7d-cm4 {
>>>>  		compatible	=3D "fsl,imx7d-cm4";
>>>>  		memory-region	=3D <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;=

>>>>  		syscon		=3D <&src>;
>>>>  		clocks		=3D <&clks IMX7D_ARM_M4_ROOT_CLK>;
>>>> +		remote-nodes	=3D <&gpt2>, <&uart1>;
>>>>  	};
>>>>
>>>
>>
>=20


--L3GsHI1MGrzj6pHfmfdEqyxmsqkB7OtCa--

--GElZvHPp20s27ufJcq0snJKId6gxPK6AF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlsnp48ACgkQdQOiSHVI
77TQ0Qf/ed6FLuPDFT+mdvlNTMhLLuWbqIm8Y+VJg1xrwSFhiXJkE/9FT9JTMyFJ
wjmPb9htGb27x75gRH4imBLGjHeDlY9V+U6LVpyleE37lvdmxYSCVwnzEwdW32Uq
3Xc6jG35oB1EP3ssaF7RKMz88rltIxk2jZJ6ZPxZkS1JfNe1+4jdRVbELrWfsQpJ
mSiszCjw/APxNs5NDq6sc+2AnkqKw1KHHNfIiCPb7fWIcGAQ9SZSN4CuskT2B2gX
w/eW6NjVw4iVhaUh8hH3HQhjzRo5OxMHTJptRuA7KfnySGhjNvOpFYhwRre3Yhtn
ysijzCNzIdSIeEyWT2cpKOLX98UKJw==
=m7tG
-----END PGP SIGNATURE-----

--GElZvHPp20s27ufJcq0snJKId6gxPK6AF--
